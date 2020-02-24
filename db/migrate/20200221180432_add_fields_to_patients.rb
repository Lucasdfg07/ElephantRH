class AddFieldsToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :company, :string
    add_column :patients, :marital_status, :string
    add_column :patients, :schooling, :string
    add_column :patients, :age, :integer
    add_column :patients, :office, :string
  end
end
