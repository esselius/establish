class AutoScalingClient
  attr_reader :client

  def initialize(client)
    @client = client
  end
end
