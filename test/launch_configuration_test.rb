require_relative 'test_helper'

class TestLaunchConfiguration < Minitest::Test
  attr_reader :ami, :instance_type

  def setup
    @name = '123'
    @ami = 'ami-1235677'
    @instance_type = 'c4.xlarge'
  end

  def test_can_define_launch_configuration_metadata
    lc = LaunchConfiguration.new(name: name,
                                 ami: ami,
                                 instance_type: instance_type)

    assert_equal name, lc.name
    assert_equal ami, lc.ami
    assert_equal instance_type, lc.instance_type
  end
end
