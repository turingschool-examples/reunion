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
    @participants.sum{|k,v| v}
  end

  def split
    total_cost / @participants.size
  end

  def owed
    @participants.map{|k,v| [k, split - v]}.to_h
  end
end
