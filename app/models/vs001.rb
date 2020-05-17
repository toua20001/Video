class Vs001 < ApplicationRecord
  has_one :vs002, dependent: :destroy
  has_many :vs003s, dependent: :delete_all

  # 動画一覧情報の取得
  def self.searchAllVideos(sort, order, sword, stype, page)
    # ソート条件の設定
    sort_c = {id: :asc}
    unless sort.nil? or order.nil? then
      sort_c = {sort => order}
    end

    # 動画一覧の取得
    if sword.blank? then
      videos = self.paginate(page: page).joins(:vs002).select(Settings.sql.vs001s.select_video_info).order(sort_c)
      count = self.joins(:vs002).select(Settings.sql.vs001s.select_video_info).order(sort_c).length
    elsif stype == "title"
      videos = self.paginate(page: page).joins(:vs002).select(Settings.sql.vs001s.select_video_info).where("title like ?", "%#{sword}%").order(sort_c)
      count = self.joins(:vs002).select(Settings.sql.vs001s.select_video_info).where("title like ?", "%#{sword}%").order(sort_c).length
    elsif stype == "tag"
      videos = self.paginate(page: page).joins(:vs002).joins(:vs003s).select(Settings.sql.vs001s.select_video_info).distinct.where("tag like ?", "%#{sword}%").order(sort_c)
      count = self.joins(:vs002).joins(:vs003s).select(Settings.sql.vs001s.select_video_info).distinct.where("tag like ?", "%#{sword}%").order(sort_c).length

    else
      videos = []
      count = 0
    end

    return videos, count
  end

  # 動画IDが一致する動画の情報を取得
  def getVideoDetail()
    video = self.vs002
    tags  = self.vs003s

    return video, tags
  end

  # 動画IDが一致する動画の情報を更新
  def updateVideoDetail(params)
    # begin transaction
    result = ActiveRecord::Base.transaction do
      # タイトルと詳細を更新する
      self.vs002.update(params.permit(:title, :description))

      # 既存のタグは削除する
      self.vs003s.destroy_all
      # 設定されたタグを新しく追加する
      params[:tag].each do |t|
        # 空ならスキップする
        if t.empty?
          next
        end
        self.vs003s.create(tag: t)
      end
    end
    return result
  end

  def remove
    result = ActiveRecord::Base.transaction do
      FileManager.removeVideo(self.vs002.path)
      self.destroy
    end

    return result
  end
end