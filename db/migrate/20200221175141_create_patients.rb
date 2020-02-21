class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.belongs_to :user, index: true
      t.string :avatar
      t.string :name
      t.timestamps
    end
  end
end
