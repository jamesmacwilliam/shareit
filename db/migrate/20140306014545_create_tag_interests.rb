class CreateTagInterests < ActiveRecord::Migration
  def change
    create_table :tag_interests do |t|
      t.string :tag_ids, array: true
      t.string :user_id
      t.string :geography_id
      t.boolean :default

      t.timestamps
    end
  end
end
