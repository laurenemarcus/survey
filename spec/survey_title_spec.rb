require('spec_helper')

describe(SurveyTitle) do
  it {should have_many(:survey_questions)}

  it("validates presence of title") do
    title = SurveyTitle.new({:survey_title => ''})
    expect(title.save()).to(eq(false))
  end
end
