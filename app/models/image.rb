class Image < ApplicationRecord
  before_destroy :clear_img

  has_attached_file :img_file, styles: { medium: '200x200>' }
  validates_attachment_content_type :img_file, :content_type => /\Aimage\/.*\Z/

  self.per_page = 10

  private

  def clear_img
    img_file.clear
  end
end
