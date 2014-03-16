class AlterTableListingAddColumnGeographyId < ActiveRecord::Migration
  def change
    add_column :listings, :geography_id, :uuid
  end
end
