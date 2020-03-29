class OfficeVisit < ApplicationRecord
  belongs_to :patient

  validates :hour, :date, presence: false

  mount_uploaders :documents, DocumentUploader
end
