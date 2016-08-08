class ReleasesController < ApplicationController
  before_action :set_release, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:new, :create, :edit, :update, :delete]

  def index
    @releases = Release.all
  end

  def show
  end

  def new
    @release = Release.new
  end

  def edit
  end

  def create
    @release = Release.new(release_params)

    if @release.save
      redirect_to @release, notice: 'Release was successfully created.'
    else
      render :new
    end
  end

  def update
    if @release.update(release_params)
      redirect_to @release, notice: 'Release was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @release.destroy
    redirect_to releases_url, notice: 'Release was successfully deleted.'
  end

  private
    def set_release
      @release = Release.find(params[:id])
    end

    def release_params
      params.require(:release).permit(:title, :description, :artist, :catalog_number, :release_art)
    end
end
