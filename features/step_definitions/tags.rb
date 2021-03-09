Given("I've logged a project called {string}") do |string|
  @project = FactoryBot.create(:project, name: string)
end

Given("two tags called {string} and {string}") do |string, string2|
  FactoryBot.create(:tag, name: string, project: @project)
  FactoryBot.create(:tag, name: string2, project: @project)
end
