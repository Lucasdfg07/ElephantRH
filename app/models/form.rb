class Form < ApplicationRecord
  belongs_to :patient
  before_create :default_values

  validates_presence_of :personal_moment, :profissional_moment,
  :interests, :conclusions, :performance_diagnostic

  validates :intelectual_map, :facilities,
  :dificulties, :psicological_concepts, presence: false

  serialize :intelectual_map, Array
  serialize :facilities, Array
  serialize :dificulties, Array
  serialize :psicological_concepts, Array

  def default_values
  	self.intelectual_map = [0,0,0,0,0]
    self.facilities = [0,0,0,0,0]
    self.dificulties = [0,0,0,0,0]
    self.psicological_concepts = [0,0,0,0,0]
  end
end
