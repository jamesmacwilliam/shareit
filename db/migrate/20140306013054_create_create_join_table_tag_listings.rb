class CreateCreateJoinTableTagListings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.string :tag_id
      t.string :listing_id

      t.timestamps
    end
  end
end
