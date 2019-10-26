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
    @participants.values.sum
  end

  def split
    total_cost / @participants.length
  end

  def owed
    @participants.reduce({}) do |accumulator, participant|
      accumulator[participant[0]] = (split - participant[1])
      accumulator
    end
  end
end
