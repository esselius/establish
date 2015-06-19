class LaunchConfiguration
  attr_reader :name, :ami, :instance_type

  def initialize(options)
    @name = options.fetch(:name)
    @ami = options.fetch(:ami)
    @instance_type = options.fetch(:instance_type)
  end
end
