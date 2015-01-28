require('spec_helper')

describe(SurveyTitle) do
  it {should have_many(:survey_questions)}

  it("validates presence of title") do
    title = SurveyTitle.new({:survey_title => ''})
    expect(title.save()).to(eq(false))
  end

  it("converts the first letter of the title to uppercase") do
    title = SurveyTitle.create({:survey_title => "coffee preferences"})
    expect(title.survey_title()).to(eq("Coffee preferences"))
  end

end
