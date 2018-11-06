class Activity
  attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    participants.values.reduce(:+)
  end

  def split
    total_cost / participants.length
  end

  def owed
    participants.reduce({}) do |bill, (participant, paid)|
      bill[participant] = split - paid
      bill
    end
  end
end
