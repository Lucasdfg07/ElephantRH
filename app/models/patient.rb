class Patient < ApplicationRecord
  belongs_to :user
  has_one :form, dependent: :destroy
  
  has_many :office_visits

  validates_presence_of :company, :marital_status, :name, :schooling, :age, :office
  
  validates :code, :avatar, presence: false

  mount_uploader :avatar, AvatarUploader


  def validate_code(code)
  	if self.code == code
  		return true
  	end
  end
  
end
