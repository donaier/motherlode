class Image < ApplicationRecord
  before_save :extract_ratio
  before_destroy :clear_img

  has_attached_file :img_file, styles: { medium: '200x200>' }

  validates_attachment_content_type :img_file, :content_type => /\Aimage\/.*\Z/

  private

  def extract_ratio
    tempfile = img_file.queued_for_write[:original]
    unless tempfile.nil?
      geometry = Paperclip::Geometry.from_file(tempfile)
      self.ratio = (geometry.width.to_f / geometry.height.to_f).to_s
    end
  end

  def clear_img
    img_file.clear
  end
end
