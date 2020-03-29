class OfficeVisit < ApplicationRecord
  belongs_to :patient
  has_many :parcels

  validates :value, :hour, :date, presence: false

  mount_uploaders :documents, DocumentUploader
end
