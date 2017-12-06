class ReservationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    ReservationMailer.reservation_email(*args).deliver_later
  end
end
# customer, host, reservation_id
