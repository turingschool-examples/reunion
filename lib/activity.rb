class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_particpant(participant)
    @participants.merge!(participant)
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.length
  end

  def owed
    @participants.transform_values do |cost|
      split - cost
    end
  end
end
