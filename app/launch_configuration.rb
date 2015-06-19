class LaunchConfiguration
  attr_reader :name, :ami, :instance_type, :user_data

  def initialize(name:, ami:, instance_type:, user_data: nil)
    @name = name
    @ami = ami
    @instance_type = instance_type
    @user_data = user_data
  end
end
