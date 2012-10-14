class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :tag
      t.references :image

      t.timestamps
    end
    add_index :taggings, :tag_id
    add_index :taggings, :image_id
  end
end
