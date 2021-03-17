class Params
  attr_reader :project_name, :tags, :notes
  def initialize(args)
    @project_name = if args.first.start_with?('@')
      nil
    else
      args.shift
    end
    @tags, notes = args.partition { |element| element.to_s.start_with?('@') }
    @notes = notes.join(' ')
  end
end
