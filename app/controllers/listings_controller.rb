class ListingsController < ApplicationController
  def index
  	@listings = Listing.order(:name).page(params[:page])
  end

  def new
    if user.customer?
      flash[:notice] = "Sorry. You are not allowed to perform this action."
      return redirect_to welcome_home_path, notice: "Sorry. You do not have the permission to verify a property."
    end
  end

end
