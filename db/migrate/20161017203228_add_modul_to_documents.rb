class AddModulToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :modul, :string
  end
end
