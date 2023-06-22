class Museum < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_latitude_or_longitude?
end
