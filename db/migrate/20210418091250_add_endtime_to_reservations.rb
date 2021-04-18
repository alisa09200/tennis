class AddEndtimeToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :end_time, :datetime
    add_column :reservations, :min, :integer
    add_column :reservations, :max, :integer
    add_column :reservations, :text, :text
    add_column :reservations, :level, :string
    add_column :reservations, :area, :text
    add_column :reservations, :city_id, :integer
  end
end
