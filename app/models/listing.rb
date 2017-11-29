class Listing < ApplicationRecord
	belongs_to :user
	mount_uploaders :photos, PhotoUploader

	paginates_per 10
end
