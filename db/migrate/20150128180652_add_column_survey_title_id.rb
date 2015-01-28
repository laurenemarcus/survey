class AddColumnSurveyTitleId < ActiveRecord::Migration
  def change
    add_column(:survey_questions, :survey_title_id, :integer)
  end
end
