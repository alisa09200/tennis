class RemoveNameFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :Name, :string
  end
end
