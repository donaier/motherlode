class Document < ApplicationRecord
  before_destroy :clear_file

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => 'application/pdf'

  scope :archived, -> { where(modul: PAST_MODULI) }

  MODULI = ['Modul 6 - rechtliche und ethische grundlagen',
            'Modul 7 - rahmenbedingungen',
            'Modul 8 - wandel, probleme, ungleichheit',
            'Modul 9 - organisationen im sozialwesen',
            'Modul 10 - fallwerkstatt',
            'Modul 11 - portfolio 2']

  PAST_MODULI = ['Modul 1 - geschichte/theorien',
                 'Modul 2 - psychologie',
                 'Modul 3 - professionelles zeug',
                 'Modul 4 - wissenschaftszeugs',
                 'Modul 5 - portfolio']

  private

  def clear_file
    file.clear
  end
end
