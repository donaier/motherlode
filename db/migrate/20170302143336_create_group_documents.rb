class CreateGroupDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :group_documents do |t|
      t.string  :title
      t.string  :user_id
      t.text    :description
      t.string  :modul
      t.integer :group

      t.timestamps
    end
  end
end
