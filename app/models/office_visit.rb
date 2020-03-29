class OfficeVisit < ApplicationRecord
  belongs_to :patient

  validates_presence_of :description

  mount_uploaders :documents, DocumentUploader
end
