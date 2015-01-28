class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table(:survey_questions) do |t|
      t.column(:survey_question, :string)
      t.timestamps
    end
  end
end
