class CreateGroupComments < ActiveRecord::Migration[5.0]
  def change
    create_table :group_comments do |t|
      t.integer :group_document_id
      t.string :user_id
      t.string :comment
      t.string :tags

      t.timestamps
    end
  end
end
