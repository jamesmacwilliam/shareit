class ListingsController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render status: 201, json: build_index_json
      end
    end
  end

  private

  def build_index_json
    tags = TagInterest.where(user_id: current_user.id, default: true).try(:tags)
    {
      listings: Listing.where(tags: tags)
    }
  end
end
