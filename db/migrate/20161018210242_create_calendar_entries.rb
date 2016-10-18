class CreateCalendarEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :calendar_entries do |t|
      t.string :modul
      t.text :description
      t.string :author
      t.date :date

      t.timestamps
    end
  end
end
