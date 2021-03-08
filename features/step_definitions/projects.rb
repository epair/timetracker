Given("I've logged two projects named {string} and {string}") do |string, string2|
  FactoryBot.create(:project, name: string)
  FactoryBot.create(:project, name: string2)
end
