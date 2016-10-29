class PagesController < ApplicationController
  layout "zhaw_layout", only: [:zhaw]

  def gallery
    @images = Image.all.order(position: :desc)
    @images_paginated = @images.paginate(:page => params[:page])
    @dates = @images_paginated.collect(&:date).uniq
  end
end
