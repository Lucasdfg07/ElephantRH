class Form < ApplicationRecord
  belongs_to :patient

  # validates_presence_of :personal_moment, :profissional_moment,
  # :interests, :conclusions, :performance_diagnostic

  validates :personal_moment, :profissional_moment,
  :interests, :conclusions, :performance_diagnostic, presence: false

  validates :intelectual_map, :facilities,
  :dificulties, :psicological_concepts, presence: false

  serialize :intelectual_map, Array
  serialize :facilities, Array
  serialize :dificulties, Array
  serialize :psicological_concepts, Array
end
