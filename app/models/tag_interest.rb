class TagInterest < ActiveRecord::Base

  belongs_to :user
  before_save :set_tag_ids

  def as_json(opts={})
    json = {
      id: id,
      tags: tags.as_json(tag_interest_id: id),
      listings_count: listings.size,
      created_at: created_at,
      updated_at: updated_at,
      default: default,
      desc: desc
    }
    json[:listings] = listings.as_json(tag_interest_id: id)
    json
  end

  def tags
    @tags ||= Tag.where(id: tag_ids)
  end

  def listings
    listing_ids = Tagging.where(tag_id: tag_ids).pluck(:listing_id)
    Listing.where(id: listing_ids)
  end

  def tags=(tags)
    self.tag_ids = tags.try(:map, &:id) || []
    @tags = tags || []
    self.save
  end

  private

  def set_tag_ids
    self.tag_ids ||= []
  end
end
