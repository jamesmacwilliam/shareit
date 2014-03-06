class CreateUsages < ActiveRecord::Migration
  def change
    create_table :usages do |t|
      t.string :listing_id
      t.string :units
      t.string :user_id
      t.boolean :completed
      t.boolean :paid

      t.timestamps
    end
  end
end
