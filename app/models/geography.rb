class Geography < ActiveRecord::Base

  has_many :listings
  belongs_to :user
  belongs_to :start_address, class_name: 'Address', foreign_key: 'start_address_id'
  belongs_to :end_address, class_name: 'Address', foreign_key: 'end_address_id'

  def as_json(opts = {})
    {
      id: id,
      start_address: start_address,
      end_address: end_address,
      miles_to_travel: miles_to_travel,
      willing_to_travel_across_state_line: willing_to_travel_across_state_line,
      state_line_fee: state_line_fee,
      created_at: created_at,
      updated_at: updated_at,
    }.merge(opts)
  end
end
