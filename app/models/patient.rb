class Patient < ApplicationRecord
  belongs_to :user

  validates_presence_of :company, :marital_status, :name, :schooling, :age, :office
  validates :avatar, presence: false

  mount_uploader :avatar, AvatarUploader
end
