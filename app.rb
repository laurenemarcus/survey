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
  survey_title_id = params.fetch("survey_title_id")
  @survey_question = SurveyQuestion.create({:survey_question => survey_question, :survey_title_id => survey_title_id})
  @survey_questions = SurveyQuestion.all()
  @survey_titles = SurveyTitle.all()
  erb(:index)
end

get("/titles/:id/edit") do
  @survey_title = SurveyTitle.find(params.fetch("id").to_i())
  @survey_questions = @survey_title.survey_questions()
  @survey_titles = SurveyTitle.all()
  erb(:survey_edit)
end

patch("/survey_title/:id") do
  survey_title = params.fetch("survey_title")
  @survey_title = SurveyTitle.find(params.fetch("id").to_i())
  @survey_title.update({:survey_title => survey_title})
  @survey_titles = SurveyTitle.all()
  @survey_questions = SurveyQuestion.all()
  erb(:survey_edit)
end

delete("/survey_title/:id") do
  @survey_title = SurveyTitle.find(params.fetch("id").to_i())
  @survey_title.delete()
  @survey_titles = SurveyTitle.all()
  @survey_questions = SurveyQuestion.all()
  erb(:index)
end

get("/survey_questions/:id/edit") do
  @survey_question = SurveyQuestion.find(params.fetch("id").to_i())
  @survey_questions = SurveyQuestion.all()
  @survey_titles = SurveyTitle.all()
  erb(:survey_edit)
end

patch("/survey_questions/:id") do
  survey_question = params.fetch("survey_question")
  @survey_question = SurveyQuestion.find(params.fetch("id").to_i())
  @survey_question.update({:survey_question => survey_question})
  @survey_questions = SurveyQuestion.all()
  @survey_titles = SurveyTitle.all()
  @survey_title = @survey_question.survey_title()

  erb(:survey_edit)
end

delete("/survey_questions/:id") do
  @survey_question = SurveyQuestion.find(params.fetch("id").to_i())
  @survey_question.delete()
  @survey_questions = SurveyQuestion.all()
  @survey_titles = SurveyTitle.all()
  erb(:index)
end
