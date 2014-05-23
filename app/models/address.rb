class Address < ActiveRecord::Base

  belongs_to :user

  def as_json(opts = {})
    {
      id: id,
      street: street,
      city: city,
      state: state,
      zip: zip,
      country: country,
      default: default,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
