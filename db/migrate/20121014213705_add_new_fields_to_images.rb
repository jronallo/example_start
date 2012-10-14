class AddNewFieldsToImages < ActiveRecord::Migration
  def change
    add_column :images, :filename, :string
    add_column :images, :description, :text
    add_column :images, :selected, :boolean
  end
end
