class Activity
  attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(name, cost)
    @participants[name] += cost
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.keys.count
  end

  def owed
    owed_hash = Hash.new { |hash, key| hash[key] = 0 }
    @participants.each do |participant, cost|
      owed_hash[participant] = split - cost
    end
    owed_hash
  end
end
