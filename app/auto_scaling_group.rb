class AutoScalingGroup
  attr_reader :name, :minimum, :desired, :maximum, :launch_configuration

  def initialize(options)
    @name = options.fetch(:name)
    @minimum = options.fetch(:minimum)
    @desired = options.fetch(:desired)
    @maximum = options.fetch(:maximum)
    @launch_configuration = options.fetch(:launch_configuration)
  end
end
