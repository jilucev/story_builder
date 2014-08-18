class OutlinesControllerController < ApplicationController
  def index
    @outline = Outline.new
  end

  def new
    @outline = Outline.new
  end

  def create
    @outline = Outline.new(outline_params)
    if @outline.save
      redirect_to :root
    else
      render 'outlines/index'
    end
  end

  private

  def outline_params
    params.require(:outline).permit(:title, :description, :tone, :mood, :aesthetic, :beats)
  end
end