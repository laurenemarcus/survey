require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get("/") do
  @survey_titles = SurveyTitle.all()
  @survey_questions = SurveyQuestion.all()
  erb(:index)
end

post("/survey_titles") do
  survey_title = params.fetch("survey_title")
  @survey_title = SurveyTitle.create({:survey_title => survey_title})
  @survey_titles = SurveyTitle.all()
  erb(:index)
end


post("/survey_questions") do
  survey_question = params.fetch("survey_question")
  @survey_question = SurveyQuestion.create({:survey_question => survey_question})
  @survey_questions = SurveyQuestion.all()
  @survey_titles = SurveyTitle.all()
  erb(:index)
end

get("/survey_questions/:id/edit") do
  @survey_question = Question.find(params.fetch("id").to_i())
  erb(:survey_question)
end

patch("/survey_question/:id") do
  survey_question = params.fetch("survey_question")
  @survey_question = SurveyQuestion.find(params.fetch("id").to_i())
  @survey_question.update({:survey_question => survey_question})
  @survey_question = SurveyQuestion.all()
  erb(:survey_question)
end

delete("/survey_question/:id") do
  @survey_question = SurveyQuestion.find(params.fetch("id").to_i())
  @survey_question.delete()
  @survey_questions = SurveyQuestion.all()
  erb(:survey_question)
end
