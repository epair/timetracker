class Params
  attr_reader :project_name, :tags, :notes
  def initialize(project_name, args)
    @project_name = project_name
    @tags, @notes = args.partition { |element| element.to_s.start_with?('@') }
  end
end
