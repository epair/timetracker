require_relative 'params'

class StartEntry
  def self.create(args)
    params = Params.new(args)
    project = Project.find_or_create_by(name: params.project_name)
    entry = Entry.create(project: project, status: :start, notes: params.notes)
    params.tags.each do |name|
      tag = Tag.find_or_create_by(name: name, project: project)
      EntryTag.create(tag: tag, entry: entry)
    end
    puts "Starting work on #{([entry.project.name] + entry.tags.map(&:name)).join(', ')} at #{entry.created_at.localtime.strftime('%I:%M%p')}"
  end
end

class TagStopEntry
  def self.create(args)
    params = Params.new(args)
    tags = Tag.where(name: params.tags)
    entry = Entry.create(status: :stop,  notes: params.notes)
    tags.each do |tag|
      EntryTag.create(tag: tag, entry: entry)
    end
    puts "Stopping work on #{params.tags.join(', ')}, continuing work on #{tags.first.project.name}"
  end
end
