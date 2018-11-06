
class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(participant, cost)
    @participants[participant] = cost
  end

  def total_cost
    total = 0
    @participants.each_value do |v|
      total += v
    end
    total
  end

  def split
    total_cost / @participants.count
  end

  def owed
    split_value = self.split
    owed_hash = {}
    @participants.each do |p, cost|
      owed_hash[p] = split_value - cost
    end
    owed_hash
  end

  def owed_by_participant(participant)
    owed[participant]
  end

end
