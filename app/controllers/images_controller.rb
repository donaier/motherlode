class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to '/gallery'
     else
       render action: 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  private

  def image_params
    params.require(:image).permit(:title, :position, :img_file, :date, :ratio, :category)
  end
end
