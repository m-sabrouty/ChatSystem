class AddNameToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :name, :string
  end
end
