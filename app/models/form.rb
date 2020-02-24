class Form < ApplicationRecord
  # validates_presence_of :personal_moment, :profissional_moment,
  # :interests, :conclusions, :performance_diagnostic

  validates :personal_moment, :profissional_moment,
  :interests, :personalities_characteristics, :conclusions,
   :performance_diagnostic, :intelectual_map, :facilities,
   :dificulties, :psicological_concepts, presence: false
end
