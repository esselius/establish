require_relative 'test_helper'

class TestAutoScalingClient < Minitest::Test
  attr_reader :client

  def setup
    @client = Aws::AutoScaling::Client.new
  end

  def test_can_create_asg
    asg_client = AutoScalingClient.new(client)
  end
end