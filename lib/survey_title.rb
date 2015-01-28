class SurveyTitle < ActiveRecord::Base
  has_many(:survey_questions)
  validates(:survey_title, {:presence => true})
  before_save(:upcase_survey_title)

private

define_method(:upcase_survey_title) do
  self.survey_title=(survey_title().capitalize())
end
end
