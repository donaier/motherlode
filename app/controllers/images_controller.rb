class ImagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authenticate_overlord

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to '/images'
     else
       render action: 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(image_params)
      redirect_to '/images'
    else
      render 'edit'
    end
  end

  def index
    @images = Image.all.order(position: :desc)
  end

  private

  def image_params
    params.require(:image).permit(:title, :position, :img_file, :date, :ratio, :category)
  end

  def authenticate_overlord
    throw(:abort) unless current_user.username == 'donat'
  end
end
