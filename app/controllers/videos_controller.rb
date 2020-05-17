class VideosController < ApplicationController
  def index
    @p = "#{flash[:search_word]} , #{flash[:search_type]}"
    @search_type = flash[:search_type]
    @videos, @count = Vs001.searchAllVideos(params[:sort], params[:order], flash[:search_word], flash[:search_type], params[:page])
  end

  def search
    # セッションに検索条件を設定
    flash[:search_word] = params[:search_word]
    flash[:search_type] = params[:search_type]

    redirect_to action: :index
  end

  def edit
    vs001 = Vs001.find(params[:id])
    @video, @tags = vs001.getVideoDetail()
  end

  def destroy
    vs001 = Vs001.find(params[:id])
    vs001.remove
    redirect_to({action: :index}, notice: "動画（id:#{params[:id]}）を削除しました。")
  end

  def update
    vs001 = Vs001.find(params[:id])
    result = vs001.updateVideoDetail(params)
    @videos = Vs001.find(params[:id])
    if result
      redirect_to({action: :show}, notice: "動画（id:#{params[:id]}）を更新しました。")
    else
      redirect_to({action: :show}, alert: "問題が発生しました。 : #{video.errors.full_messages}")
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
    m, e = FileManager.importFiles
    redirect_to videos_url, notice: m[0]
  end

  def tags
    @tags = Vs003.getTagList
  end
end
