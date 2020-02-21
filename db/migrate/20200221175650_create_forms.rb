class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.string :personal_moment
      t.string :profissional_moment
      t.string :interests
      t.string :conclusions
      t.string :intelectual_map, array: true, default: []
      t.string :facilities, array: true, default: []
      t.string :dificulties, array: true, default: []
      t.string :psicological_concepts, array: true, default: []
      t.timestamps
    end
  end
end
