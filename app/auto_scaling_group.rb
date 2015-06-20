# rubocop:disable Metrics/ParameterLists

class AutoScalingGroup
  attr_reader :name, :minimum, :desired, :maximum, :launch_configuration, :tags

  def initialize(name:, minimum:, desired:, maximum:, launch_configuration:,
                 tags:)
    @name = name
    @minimum = minimum
    @desired = desired
    @maximum = maximum
    @launch_configuration = launch_configuration
    @tags = tags
  end
end
