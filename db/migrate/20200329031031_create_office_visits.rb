class CreateOfficeVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :office_visits do |t|
      t.references :patient, foreign_key: true
      t.date :date
      t.string :hour
      t.string :description
      t.float :value
      t.json :documents

      t.timestamps
    end
  end
end
