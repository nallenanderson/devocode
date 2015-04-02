class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  def index
    @course = Course.find(params[:course_id])
    @videos = Video.all
  end

  def show
    @course = Course.find(params[:course_id])
    @video = Video.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @course = Course.find(params[:course_id])
    @video = Video.new(video_params)
    @video.course_id = @course_id

    respond_to do |format|
      if @video.save
        format.html { redirect_to video_path(@video), notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: video_path(@video) }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to video_path(@video), notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: video_path(@video) }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @video = Video.find(params[:id])
    @video.destroy
    respond_to do |format|
      format.html { redirect_to course_videos_path, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:name, :link, :description, :viewed, :course_id)
    end
end
