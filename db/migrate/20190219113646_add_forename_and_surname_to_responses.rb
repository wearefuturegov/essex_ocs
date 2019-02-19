class AddForenameAndSurnameToResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :responses, :forename, :string
    add_column :responses, :surname, :string
  end
end
