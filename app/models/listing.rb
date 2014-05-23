class Listing < ActiveRecord::Base

  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user
  belongs_to :geography
  belongs_to :usage

  validate :validate_rate_type

  RATE_TYPES = %w(hour minute mile fixed)

  def as_json_sub(opts = {})
    {
      id: id,
      tags: tags.as_json(listing_id: id),
      geography: geography.as_json(listing_id: id),
      listing_start: listing_start,
      listing_end: listing_end,
      photos: photos,
      rate: rate,
      rate_type: rate_type,
      deposit: deposit,
      created_at: created_at,
      updated_at: updated_at,
      desc: desc
    }.merge(opts)
  end

  def tag_ids=(tag_ids)
    Tagging.where(listing_id: id).destroy_all
    if tag_ids
      tag_ids.map do |tag_id|
        Tagging.create! listing_id: id, tag_id: tag_id
      end
    else
      []
    end
  end

  def tag_names=(tag_names)
    Tagging.where(listing_id: id).destroy_all
    if tag_names
      tag_names.map do |tag_name|
        self.tags << Tag.find_or_create_by(name: tag_name)
      end
    else
      []
    end
  end

  def tag_ids
    taggings.map(&:tag_id)
  end

  def tag_names
    tags.map(&:name)
  end

  private

  def validate_rate_type
    unless rate_type.nil? || RATE_TYPES.include?(rate_type)
      errors[:rate_type] << 'Invalid rate type'
    end
  end
end
