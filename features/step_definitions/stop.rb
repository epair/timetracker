Given("I've starting tracking for {string}") do |string|
  FactoryBot.create(:project, name: string)
end

Given("I've starting tracking for {string} {string}") do |string, string2|
  project = FactoryBot.create(:project, name: string)
  FactoryBot.create(:tag, name: string2, project: project)
end

Then('creates an entry with a project with a stop status') do
  project = Project.find_by(name: 'myproject')
  entry = project.entries.last

  expect(entry.status).to eq('stop')
end

Then('creates an entry with a tag with a stop status') do
  tag = Tag.find_by(name: '@testing')
  entry = tag.entries.last

  expect(entry.status).to eq('stop')
end
