class ListingsController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render status: 201, json: {listings: models_owned_by_user(Listing) }
      end
    end
  end
end
