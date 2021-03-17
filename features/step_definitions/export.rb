Given("that I've used the app for tracking") do
  project = FactoryBot.create(:project)
  FactoryBot.create(:entry, status: :start, project: project)
end
