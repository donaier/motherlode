class AddTagsToGroupDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :group_documents, :tags, :string
  end
end
