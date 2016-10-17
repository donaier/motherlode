class Document < ApplicationRecord
  before_destroy :clear_file

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => 'application/pdf'

  MODULI = ['Modul 1 - geschichte/theorien',
            'Modul 2 - psychologie',
            'Modul 3 - professionelles zeug',
            'Modul 4 - wissenschaftszeugs',
            'Modul 5 - portfolio']

  private

  def clear_file
    file.clear
  end
end
