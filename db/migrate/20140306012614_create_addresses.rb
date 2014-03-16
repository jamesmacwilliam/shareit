class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.uuid :user_id
      t.boolean :default

      t.timestamps
    end
  end
end
