class VideosController < ApplicationController
  def index
    session.clear
    @videos, @count = Vs001.searchAllVideos(params.permit(:sort, :order, :search_word, :search_type, :page).to_h)
  end

  def search
    @parameters = Hash.new
    # セッションに検索条件を設定
    unless params[:commit].nil? then
      session[:search_word] = params[:search_word]
      session[:search_type] = params[:search_type]
    end


    @p = "#{session[:search_word]} , #{session[:search_type]} search!!"
    @videos, @count = Vs001.searchAllVideos(params.permit(:sort, :order, :search_word, :search_type, :page).to_h)

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
