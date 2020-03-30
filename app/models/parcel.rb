class Parcel < ApplicationRecord
	belongs_to :office_visit

	validates_presence_of :value
end
