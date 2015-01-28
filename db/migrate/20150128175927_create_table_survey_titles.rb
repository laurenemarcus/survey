class CreateTableSurveyTitles < ActiveRecord::Migration
  def change
    create_table(:survey_titles) do |t|
      t.column(:survey_title, :string)
      t.timestamps
    end
  end
end
