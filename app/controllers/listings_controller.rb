class ListingsController < ApplicationController
  def index
  	@listings = Listing.order(:name).page(params[:page])
  end
end
