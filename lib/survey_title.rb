class SurveyTitle < ActiveRecord::Base
  has_many(:survey_questions)
  validates(:survey_title, {:presence => true})
end
