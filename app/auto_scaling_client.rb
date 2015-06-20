class AutoScalingClient
  attr_reader :client

  def initialize(client)
    @client = client
  end

  def create_lc(lc)
    client.create_launch_configuration(
      launch_configuration_name: lc.name,
      image_id: lc.ami,
      instance_type: lc.instance_type,
      user_data: lc.user_data
    )
  end

  def create_asg(asg)
    client.create_auto_scaling_group(
      auto_scaling_group_name: asg.name,
      launch_configuration_name: asg.launch_configuration,
      min_size: asg.minimum,
      desired_capacity: asg.desired,
      max_size: asg.maximum,
      tags: create_asg_tags(asg.tags)
    )
  end

  private

  def create_asg_tags(tags)
    tags.map do |key, value|
      {
        key: key,
        value: value,
        propagate_at_launch: true
      }
    end
  end
end
