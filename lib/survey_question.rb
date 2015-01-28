class SurveyQuestion < ActiveRecord::Base
  belongs_to(:survey_title)
  validates(:survey_question, {:presence => true})
end
