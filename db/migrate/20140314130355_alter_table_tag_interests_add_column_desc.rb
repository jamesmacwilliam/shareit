class AlterTableTagInterestsAddColumnDesc < ActiveRecord::Migration
  def change
    add_column :tag_interests, :desc, :string
  end
end
