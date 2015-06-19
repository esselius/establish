class HostGroup
  attr_reader :asg, :lc

  def initialize(asg, lc)
    @asg = asg
    @lc = lc
  end

  def up(client)
    client.create_lc(name: lc.name,
                     ami: lc.ami,
                     instance_type: lc.instance_type)

    client.create_asg(name: asg.name,
                      lc_name: lc.name,
                      minimum: asg.minimum,
                      desired: asg.desired,
                      maximum: asg.maximum)
  end
end
