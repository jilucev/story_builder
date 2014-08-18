class OutlinesController < ApplicationController
  def index
    @outlines = Outline.all
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

  def edit
    @outline = Outline.find(params[:id])
  end

  def show
    @outline = Outline.find(params[:id])
  end

  def update
    @outline = Outline.find(params[:id])

    if @outline.update(outline_params)
      redirect_to @outline
    else
      render 'edit'
    end
  end

  def destroy
    @outline = Outline.find(params[:id])
    @outline.destroy
    flash[:notice] = "outline deleted"
    redirect_to outlines_path
  end

  private

  def outline_params
    params.require(:outline).permit(:id, :description, :tone, :mood, :aesthetic, :beats)
  end
end