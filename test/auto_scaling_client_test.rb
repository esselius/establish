require_relative 'test_helper'

class TestAutoScalingClient < Minitest::Test
  attr_reader :client

  def setup
    @client = Aws::AutoScaling::Client.new
  end

  def test_can_create_asg
    asg_client = AutoScalingClient.new(client)

    asg = AutoScalingGroup.new(name: '123', launch_configuration: '123-lc',
                               minimum: 1, desired: 2, maximum: 3,
                               tags: { service: 'email', port: '110' })

    asg_client.create_asg(asg)
  end
end
