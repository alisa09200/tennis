class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.string :name
      t.integer :reservation_id

      t.timestamps
    end
  end
end
