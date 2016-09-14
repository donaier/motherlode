class PagesController < ApplicationController

  def gallery
    @images = Image.all.order(:position)
  end
end
