class CreateCreateJoinTableTagListings < ActiveRecord::Migration
  def change
    create_table :taggings, id: :uuid do |t|
      t.uuid :tag_id
      t.uuid :listing_id

      t.timestamps
    end
  end
end
