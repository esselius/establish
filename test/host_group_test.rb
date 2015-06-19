require_relative 'test_helper'

class TestHostGroup < Minitest::Test
  attr_reader :lc, :asg

  def setup
    @lc = LaunchConfiguration.new(name: '123',
                                  ami: 'ami-12343243',
                                  instance_type: 'c4.large')

    @asg = AutoScalingGroup.new(name: '123',
                                minimum: 1,
                                desired: 2,
                                maximum: 3)
  end

  def test_can_bootstrap_host_group
    host_group = HostGroup.new(asg, lc)
    asg_client = AutoScalingClient.new(Aws::AutoScaling::Client.new)

    assert host_group.up(asg_client)
  end
end
