class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update] 

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      flash[:success] = "Listing Successfully Created"
      redirect_to listings_path
    else
      render 'new'
    end
  end

  def index
  	@listings = Listing.order(:name).page(params[:page])
  end

  def show
    @reservation = @listing.reservations.new
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render :edit
    end
  end

  def edit
  end

  def new
    @listing = Listing.new
    # if user.customer?
    #   flash[:notice] = "Sorry. You are not allowed to perform this action."
    #   return redirect_to welcome_home_path, notice: "Sorry. You do not have the permission to verify a property."
    # end
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:name, :property_type, :room_number, 
      :bed_number, :guest_number, :country, :state, :city, :zipcode, 
      :address, :price, :description, photos:[])
  end

end
