class AutoScalingGroup
  attr_reader :name, :minimum, :desired, :maximum, :launch_configuration

  def initialize(name:, minimum:, desired:, maximum:, launch_configuration: nil)
    @name = name
    @minimum = minimum
    @desired = desired
    @maximum = maximum
    @launch_configuration = launch_configuration
  end
end
