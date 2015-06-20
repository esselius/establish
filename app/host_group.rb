class HostGroup
  attr_reader :asg, :lc

  def initialize(asg, lc)
    @asg = asg
    @lc = lc
  end

  def up(client)
    client.create_lc(lc)
    client.create_asg(asg)
  end
end
