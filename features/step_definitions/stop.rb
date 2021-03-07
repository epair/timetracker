Then('creates an entry with a stop status') do
  project = Project.find_by(name: 'myproject')
  entry = project.entries.last

  expect(entry.status).to eq('stop')
end
