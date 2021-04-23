class RemoveNameFromParticipants < ActiveRecord::Migration[6.0]
  def change
    remove_column :participants, :Name, :string
  end
end
