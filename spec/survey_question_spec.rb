require('spec_helper')

describe(SurveyQuestion) do
  it { should belong_to(:survey_title) }

  it("validates presence of questions") do
    title = SurveyQuestion.new({:survey_question => ''})
    expect(title.save()).to(eq(false))
  end
end
