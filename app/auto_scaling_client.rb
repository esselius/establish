class AutoScalingClient
  attr_reader :client

  def initialize(client)
    @client = client
  end

  def create_lc(name:, ami:, instance_type:, user_data: nil)
    client.create_launch_configuration(
      launch_configuration_name: name,
      image_id: ami,
      instance_type: instance_type,
      user_data: user_data
    )
  end

  def create_asg(name:, lc_name:, minimum:, desired:, maximum:)
    client.create_auto_scaling_group(
      auto_scaling_group_name: name,
      launch_configuration_name: lc_name,
      min_size: minimum,
      desired_capacity: desired,
      max_size: maximum
    )
  end
end
