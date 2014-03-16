class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings, id: :uuid do |t|
      t.datetime :listing_start
      t.datetime :listing_end
      t.string :photos, array: true
      t.string :rate
      t.string :rate_type
      t.string :deposit

      t.timestamps
    end
  end
end
