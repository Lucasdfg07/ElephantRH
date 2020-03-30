class AddCodeToPatient < ActiveRecord::Migration[5.2]
  def change
  	add_column :patients, :code, :integer
  end
end
