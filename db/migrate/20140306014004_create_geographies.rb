class CreateGeographies < ActiveRecord::Migration
  def change
    create_table :geographies do |t|
      t.string :start_address_id
      t.string :end_address_id
      t.string :miles_to_travel
      t.boolean :willing_to_travel_across_state_line
      t.string :state_line_fee

      t.timestamps
    end
  end
end
