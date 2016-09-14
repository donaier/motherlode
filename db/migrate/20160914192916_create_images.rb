class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.string :category
      t.integer :position
      t.date :date
      t.string :ratio

      t.timestamps
    end
  end
end
