class PagesController < ApplicationController

  def gallery
    @photos = Dir.entries('app/assets/images/gallery') - ['.', '..']
  end
end
