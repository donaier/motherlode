class AddGroupDocumentAttachments < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :group_documents, :file
  end

  def self.down
    remove_attachment :group_documents, :file
  end
end
