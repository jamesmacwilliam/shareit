class CreateUsages < ActiveRecord::Migration
  def change
    create_table :usages, id: :uuid do |t|
      t.uuid :listing_id
      t.string :units
      t.uuid :user_id
      t.boolean :completed
      t.boolean :paid

      t.timestamps
    end
  end
end
