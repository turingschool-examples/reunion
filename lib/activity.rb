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
    money = @participants.map do |participant, cost|
      cost
    end
    money.sum
  end

  def total_participants
    @participants.count
  end

  def split
    total_cost / total_participants
  end

  def owed
    money_owed = Hash.new(0)
    @participants.each do |participant, paid|
      money_owed[participant] = (split - paid)
    end
    money_owed
  end
end
