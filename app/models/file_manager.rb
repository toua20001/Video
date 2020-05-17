class FileManager < ApplicationRecord
  @@messages = []
  @@errors = []


  def self.refleshMessage
    @@messages = []
    @@errors = []
  end

  def self.getMessages
    return @@messages, @@errors
  end

  def self.searchUploadFiles
    flist = []
    upload_path = "#{Settings.path.public_path}#{Settings.path.upload_path}"

    Dir.glob("#{upload_path}/*") do |f|
      info = []
      info.push(f)
      info.push(File.stat(f).mtime.to_datetime.strftime("%Y/%m/%d %H:%M:%S"))
      flist.push(info)
    end
    @@messages.push("#{flist.length}件の動画が見つかりました。")
    return flist
  end

  def self.importFiles
    # メッセージの初期化
    self.refleshMessage

    video_path = "#{Settings.path.public_path}#{Settings.path.video_path}"
    image_path = "#{Settings.path.public_path}#{Settings.path.image_path}"
    remove_path = "#{Settings.path.public_path}#{Settings.path.remove_path}"

    # 処理したファイルのリスト
    skip_files = []
    import_files = []

    flist = self.searchUploadFiles
    flist.each do |f|
      bname = File.basename(f[0])

      begin
        # ファイルが重複しているかどうかのチェック
        if File.exist?("#{video_path}/#{bname}")
          raise "すでに登録されている動画ファイルです。"
        end

        # ファイルのコピー
        vp = "#{Settings.path.video_path}/#{bname}"
        FileUtils.cp(f[0], "#{video_path}/#{bname}")
        # 動画の読み込み
        video = FFMPEG::Movie.new(f[0])
        # サムネイルの作成
        fhead = File.basename(f[0], ".*")
        ip = "#{Settings.path.image_path}/#{fhead}.jpg"
        video.screenshot("#{image_path}/#{fhead}.jpg", {resolution: '320x180'}, preserve_aspect_ratio: :width)
        # 再生時間の取得
        # play_time =""
        # DBの登録
        tr = ActiveRecord::Base.transaction do
          vs001 = Vs001.create(favorite: 0)
          vs001.build_vs002(title: fhead, description: "", path: vp, img_path: ip, created_at: f[1])
          vs001.save
        end
        # import元ファイルの削除
        if tr then
          FileUtils.rm(f[0])
          import_files.push(bname)
        else
          raise "トランザクション処理に失敗しました。"
        end
        # 例外発生時の処理
      rescue => e
        skip_files.push(bname)
        @@errors.push(e.message)
        p e.message
        # ファイルの移動と削除
        FileUtils.cp(f[0], "#{remove_path}/#{bname}")
        FileUtils.rm(f[0])
      end
    end

    @@messages.push("#{import_files.length}件の動画を登録しました。")
    @@messages.push("#{skip_files.length}件の動画をスキップしました。")
  end
end
