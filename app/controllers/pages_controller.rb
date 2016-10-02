class PagesController < ApplicationController

  def gallery
    @images = Image.all.order(position: :desc)
    @dates = @images.collect(&:date).uniq
  end
end
