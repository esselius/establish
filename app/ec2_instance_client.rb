class Ec2InstanceClient
  include Concord.new(:client)

  def find_tags(tags)
    filters = []

    filters += tags.map do |key, value|
      {
        name: 'tag:' + key.to_s,
        values: [value]
      }
    end

    instance_ids(filters)
  end

  private

  def filter_defaults
    [
      {
        name: 'instance-state-name',
        values: ['running']
      }
    ]
  end

  def instances(filters)
    reservations = client.describe_instances(
      filters: filter_defaults + filters
    )[:reservations]

    reservations.map do |reservation|
      reservation[:instances]
    end.flatten
  end

  def instance_ids(filters)
    instances(filters).map(&:instance_id)
  end
end
