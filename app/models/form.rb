class Form < ApplicationRecord
  belongs_to: :patient

  validates_presence_of :personal_moment, :profissional_moment,
  :interests, :conclusions, :intelectual_map, :facilities,
  :dificulties, :psicological_concepts
end
