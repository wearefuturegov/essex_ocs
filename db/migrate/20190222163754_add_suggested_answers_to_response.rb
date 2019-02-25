class AddSuggestedAnswersToResponse < ActiveRecord::Migration[5.2]
  def change
    add_column :responses, :suggested_category, :text
    add_column :responses, :suggested_help_category, :text
    add_column :responses, :suggested_info_type, :text
  end
end
