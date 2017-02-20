class CalendarEntry < ApplicationRecord

  scope :batches, -> { select(:date, :modul).distinct }

  MODULI = ['1.1', '1.2', '2.1', '2.2', '3.1', '3.2', '4.1', '4.2', '5', '6.1', '7.1', '8', '9', '10', '11']

  def start_time
    self.date
  end

  def self.detail_groups(date)
    where(date: date).group_by(&:modul)
  end
end
