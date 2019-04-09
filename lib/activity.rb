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
    participants.values.sum
  end

  def split
    participants.values.sum / participants.values.length
    #will truncate for non-integer splits
  end

  def owed
    @participants.transform_values{|v| split - v}
  end
end
