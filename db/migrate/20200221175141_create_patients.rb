class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.belongs_to :user, index: true
      t.belongs_to :form, index: true
      t.json :avatar
      t.string :name
      t.timestamps
    end
  end
end
