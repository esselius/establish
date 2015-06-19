require_relative 'test_helper'

class TestAutoScalingClient < Minitest::Test
  attr_reader :client

  def setup
    @client = Aws::AutoScaling::Client.new
  end

  def test_can_create_asg
    asg_client = AutoScalingClient.new(client)

    asg_client.create_asg(name: '123',
                          lc_name: '123-lc',
                          minimum: 1,
                          desired: 2,
                          maximum: 3)
  end
end
