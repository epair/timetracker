Given("I've starting tracking for {string}") do |string|
  FactoryBot.create(:project, name: string)
end

Then('creates an entry with a stop status') do
  project = Project.find_by(name: 'myproject')
  entry = project.entries.last

  expect(entry.status).to eq('stop')
end
