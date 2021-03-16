Then('creates an entry with a start status') do
  project = Project.find_by(name: 'myproject')
  entry = project.entries.last

  expect(entry.status).to eq('start')
end

Then('creates an entry tag called @testing') do
  project = Project.find_by(name: 'myproject')
  tag = Tag.find_by(name: '@testing')
  entry = project.entries.last

  expect(entry.tags).to include(tag)
end

Then('creates an entry tag called @pairing') do
  project = Project.find_by(name: 'myproject')
  tag = Tag.find_by(name: '@pairing')
  entry = project.entries.last

  expect(entry.tags).to include(tag)
end
