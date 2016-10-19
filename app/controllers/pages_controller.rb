class PagesController < ApplicationController
  layout "zhaw_layout", only: [:zhaw]

  def gallery
    @images = Image.all.order(position: :desc)
    @dates = @images.collect(&:date).uniq
  end
end
