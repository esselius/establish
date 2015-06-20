require_relative 'test_helper'

class TestEc2InstanceClient < Minitest::Test
  attr_reader :client

  def setup
    @client = Aws::EC2::Client.new
  end

  def test_can_find_instances_with_tags
    client.stub_responses(
      :describe_instances,
      {
        reservations: [
          instances: [
            {
              instance_id: 'i-1234567'
            }
          ]
        ]
      }
    )

    ec2_client = Ec2InstanceClient.new(client)

    instances = ec2_client.find_tags(name: '123',
                        service: 'email')

    assert_includes instances, 'i-1234567'
  end
end
