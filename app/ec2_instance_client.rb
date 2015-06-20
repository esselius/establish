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

  def reservations(filters)
    client.describe_instances(
      filters: filters
    )[:reservations]
  end

  def instances(filters)
    reservations(filters).map do |reservation|
      reservation[:instances]
    end.flatten
  end

  def instance_ids(filters)
    instances(filters).map(&:instance_id)
  end
end
