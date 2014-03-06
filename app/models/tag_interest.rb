class TagInterest < ActiveRecord::Base
  belongs_to :user

  def tags
    @tags ||= Tag.where(tag_id: tag_ids)
  end
end
