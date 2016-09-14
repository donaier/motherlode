class PagesController < ApplicationController

  def gallery
    @images = Image.all.order(:position)
    @photos = Dir.entries('app/assets/images/gallery') - ['.', '..', '.DS_Store']
  end
end
