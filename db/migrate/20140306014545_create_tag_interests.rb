class CreateTagInterests < ActiveRecord::Migration
  def change
    create_table :tag_interests, id: :uuid do |t|
      t.string :tag_ids, array: true
      t.uuid :user_id
      t.uuid :geography_id
      t.boolean :default

      t.timestamps
    end
  end
end
