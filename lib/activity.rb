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
    owed_hash = participants.dup
    owed_hash.each_pair{|k, v| owed_hash[k] = split - v}
  end
end
