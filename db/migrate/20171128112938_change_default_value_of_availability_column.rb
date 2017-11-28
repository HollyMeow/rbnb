class ChangeDefaultValueOfAvailabilityColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :petsitters, :availability, :boolean, default: true
  end
end
