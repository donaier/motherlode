class Document < ApplicationRecord
  before_destroy :clear_file

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => 'application/pdf'

  private

  def clear_file
    file.clear
  end
end
