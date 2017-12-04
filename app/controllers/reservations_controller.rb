class ReservationsController < ApplicationController
	def create
		@listing = Listing.find(params[:listing_id])
		@reservation = current_user.reservations.new(reservation_params)
		@reservation.listing = @listing
		if @reservation.save
			redirect_to current_user, notice: 'Reservation was successfully created.'
		else
			render "listings/show"
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to @reservation.user, notice: 'Reservation was successfully cancelled.'
	end

	def index
		@reservations = Reservation.all
	end

	private

	def reservation_params
		params.require(:reservation).permit(:num_guests, :checkin_date, :checkout_date)
	end
end
