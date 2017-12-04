class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations
	mount_uploaders :photos, PhotoUploader

	paginates_per 10
end
