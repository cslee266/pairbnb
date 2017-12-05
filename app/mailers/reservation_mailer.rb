class ReservationMailer < ApplicationMailer
  def reservation_email(customer, host, reservation_id)
  	@customer = customer
  	@host = host
  	mail(to: @host.email, subject: 'You have a new reservation!')
  end
end
