class Ec2InstanceClient
  include Concord.new(:client)

  def find_tags(tags)
    filters = []

    filters + tags.map do |key, value|
      {
        name: 'tag:' + key.to_s,
        values: [value]
      }
    end

    reservations = client.describe_instances(
      filters: filters
    )[:reservations]

    instances = reservations.map do |reservation|
      reservation[:instances]
    end.flatten

    instances.map(&:instance_id)
  end
end
