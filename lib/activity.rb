class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    @participants.sum do |k, v|
      v
    end
  end

  def split
    total_cost / @participants.length
  end

  def owed
    @participants.transform_values do |v|
      split - v
    end
  end
end
