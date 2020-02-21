class Patient < ApplicationRecord
  belongs_to: :user

  validates_presence_of :name
  validates :avatar, presence: false
end
