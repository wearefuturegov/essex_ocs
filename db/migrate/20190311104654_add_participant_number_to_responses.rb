class AddParticipantNumberToResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :responses, :participant_number, :string
  end
end
