class Geography < ActiveRecord::Base
  has_many :listings
  belongs_to :user
  belongs_to :start_address, class_name: 'Address', foreign_key: 'start_address_id'
  belongs_to :end_address, class_name: 'Address', foreign_key: 'end_address_id'
end
