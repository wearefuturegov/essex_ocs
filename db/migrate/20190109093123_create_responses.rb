class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.text :category
      t.text :help_category, array: true, default: []
      t.text :info_type, array: true, default: []
      t.text :payment_options, array: true, default: []

      t.timestamps
    end
  end
end
