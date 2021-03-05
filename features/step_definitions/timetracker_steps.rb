require_relative '../../lib/models/project'
require_relative '../../lib/models/entry'

Then('an entry for myproject should be created') do
  project = Project.find_by(name: 'myproject')
  entry = Entry.find_by(project: project)

  expect(entry.project.name).to eq('myproject')
end
