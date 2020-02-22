class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.belongs_to :patient, index: true
      t.string :personal_moment
      t.string :profissional_moment
      t.string :interests
      t.string :conclusions
      t.string :intelectual_map
      t.string :facilities
      t.string :dificulties
      t.string :psicological_concepts
      t.string :performance_diagnostic
      t.timestamps
    end
  end
end
