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

  def split
    total_cost / @participants.count
  end

  def owed
    split_value = split
    new_hash = @participants.each do |name, payment|
      @participants[name] = (payment - split_value) * -1
    end
    new_hash
  end
end
