class AddTextToParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :participants, :text, :text
  end
end
