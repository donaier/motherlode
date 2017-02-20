class Document < ApplicationRecord
  before_destroy :clear_file

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => 'application/pdf'

  MODULI = ['Modul 6 - rechtliche und ethische grundlagen',
            'Modul 7 - rahmenbedingungen',
            'Modul 8 - wandel, probleme, ungleichheit',
            'Modul 9 - organisationen im sozialwesen',
            'Modul 10 - fallwerkstatt',
            'Modul 11 - portfolio 2']

  private

  def clear_file
    file.clear
  end
end
