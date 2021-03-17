require_relative 'params'

class StartEntry
  def self.create(project_name, args)
    params = Params.new(project_name, args)
    project = Project.find_or_create_by(name: project_name)
    entry = Entry.create(project: project, status: :start, notes: params.notes.join(' '))
    params.tags.each do |name|
      tag = Tag.find_or_create_by(name: name, project: project)
      EntryTag.create(tag: tag, entry: entry)
    end
    entry
  end
end
