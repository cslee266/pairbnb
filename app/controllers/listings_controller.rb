class ListingsController < ApplicationController
  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id if current_user
    if @listing.save
      flash[:success] = "Listing Successfully Created"
      redirect_to user_listings_path
    else
      render 'new'
    end
  end

  def index
  	@listings = Listing.order(:name).page(params[:page])
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
    # if user.customer?
    #   flash[:notice] = "Sorry. You are not allowed to perform this action."
    #   return redirect_to welcome_home_path, notice: "Sorry. You do not have the permission to verify a property."
    # end
  end

  def listing_params
    params.require(:listing).permit(:name, :property_type, :room_number, 
      :bed_number, :guest_number, :country, :state, :city, :zipcode, 
      :address, :price, :description, photos:[])
  end

end
