class Listing < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user
  belongs_to :geography
  belongs_to :usage
end
