class TagInterestsController < ApplicationController

  def index
    respond_to do |format|
      format.json do
        render status: 201, json: {tag_interests: models_owned_by_user(TagInterest)}
      end
    end
  end

  def show
    respond_to do |format|
      format.json do
        render status: 201, json: {tag_interest: models_owned_by_user(TagInterest).find(params[:id]).as_json(include_listings: true)}
      end
    end
  end
end
