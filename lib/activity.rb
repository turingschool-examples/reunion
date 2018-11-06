class Activity
  attr_reader :name, :participants
  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(name, payment)
    @participants[name] = payment
  end

  def total_cost
    @participants.map do |name, payment|
      payment
    end.sum
  end
end
