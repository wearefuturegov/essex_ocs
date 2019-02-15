class AddPhoneNumberToResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :responses, :phone_number, :string
  end
end
