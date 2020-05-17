class VideosController < ApplicationController
  def index
    @p = "#{flash[:search_word]} , #{flash[:search_type]}"
    @search_type = flash[:search_type]
    @videos = Vs001.searchAllVideos(params[:sort], params[:order], flash[:search_word], flash[:search_type])
  end

  def search
    # セッションに検索条件を設定
    flash[:search_word] = params[:search_word]
    flash[:search_type] = params[:search_type]

    redirect_to videos_url
  end

  def edit
    vs001 = Vs001.find(params[:id])
    @video, @tags = vs001.getVideoDetail()
  end

  def update
    vs001 = Vs001.find(params[:id])
    result = vs001.updateVideoDetail(params)
    if result
      redirect_to video_url, notice: "動画（id:#{params[:id]}）を更新しました。"
    else
      redirect_to edit_video_url, alert: "問題が発生しました。 : #{video.errors.full_messages}" 
    end
  end

  def show
    vs001 = Vs001.find(params[:id])
    @video, @tags = vs001.getVideoDetail()
    @video.path.strip!
  end

  def upload
    @flist = FileManager.searchUploadFiles()
  end

  def import
    FileManager.importFiles
    redirect_to videos_url, notice: "import"
  end
end
