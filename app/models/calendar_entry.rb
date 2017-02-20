class CalendarEntry < ApplicationRecord

  scope :batches, -> { select(:date, :modul).distinct }

  MODULI = ['6.1', '7.1', '8', '9', '10', '11']

  def start_time
    self.date
  end

  def self.detail_groups(date)
    where(date: date).group_by(&:modul)
  end
end
