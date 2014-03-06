class AlterTableListingAddColumnDesc < ActiveRecord::Migration
  def change
    add_column :listings, :desc, :string
  end
end
