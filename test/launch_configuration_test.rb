# rubocop:disable Metrics/AbcSize

require_relative 'test_helper'

class TestLaunchConfiguration < Minitest::Test
  attr_reader :ami, :instance_type, :user_data

  def setup
    @name = '123'
    @ami = 'ami-1235677'
    @instance_type = 'c4.xlarge'
    @user_data = <<EOF
#!/bin/bash
echo ehlo
EOF
  end

  def test_can_create_launch_configuration
    lc = LaunchConfiguration.new(name: name,
                                 ami: ami,
                                 instance_type: instance_type,
                                 user_data: user_data)

    assert_equal name, lc.name
    assert_equal ami, lc.ami
    assert_equal instance_type, lc.instance_type
    assert_equal user_data, lc.user_data
  end
end
