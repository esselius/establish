# rubocop:disable Metrics/AbcSize

require_relative 'test_helper'

class TestAutoScalingGroup < Minitest::Test
  attr_reader :minimum, :desired, :maximum, :launch_configuration

  def setup
    @name = '123'
    @minimum = 1
    @desired = 2
    @maximum = 3
    @launch_configuration = '123-lc'
  end

  def test_can_define_auto_scaling_group_metadata
    asg = AutoScalingGroup.new(name: name,
                               minimum: minimum,
                               desired: desired,
                               maximum: maximum,
                               launch_configuration: launch_configuration)

    assert_equal name, asg.name
    assert_equal minimum, asg.minimum
    assert_equal desired, asg.desired
    assert_equal maximum, asg.maximum
    assert_equal launch_configuration, asg.launch_configuration
  end
end
