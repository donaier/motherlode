class AddImgFileToImages < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :images, :img_file
  end

  def self.down
    remove_attachment :images, :img_file
  end
end
