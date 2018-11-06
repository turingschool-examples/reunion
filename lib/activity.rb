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
end
