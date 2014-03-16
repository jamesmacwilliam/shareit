class AlterTableGeographyAddColumnUserId < ActiveRecord::Migration
  def change
    add_column :geographies, :user_id, :uuid
  end
end
