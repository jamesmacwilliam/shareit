class Tag < ActiveRecord::Base

  has_many :taggings
  has_many :listings, through: :taggings

  def as_json(opts={})
    {
      id: id,
      name: name,
      created_at: created_at,
      updated_at: updated_at
    }.merge(opts)
  end
end
