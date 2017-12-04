class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	validate :check_overlapping_dates
	validate :check_max_guests

	def check_overlapping_dates
		# compare this new reservation against existing reservations
		listing.reservations.each do |old_reservation|
			if overlap?(self, old_reservation)
				errors.add(:overlapping_dates, "The reservation date conflicts with 
				  other existing reservations.")
			end
		end
	end

	def overlap?(x,y)
		(x.checkin_date - y.checkout_date) * (y.checkin_date - x.checkout_date) > 0
	end

	def check_max_guests
		max_guests = listing.guest_number
		return if num_guests < max_guests.to_i
		errors.add(:max_guests, "Max guests number exceeded.")
	end

	def total_price
		price = listing.price
		num_dates = (checkin_date..checkout_date).to_a.length - 1
		return price * num_dates
	end

end
