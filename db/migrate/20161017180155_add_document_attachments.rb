class AddDocumentAttachments < ActiveRecord::Migration[5.0]
  def self.up
    add_attachment :documents, :file
  end

  def self.down
    remove_attachment :documents, :file
  end

end
