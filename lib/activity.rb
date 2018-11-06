class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(person, amount_paid)
    @participants[person] = amount_paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    number_of_participants = @participants.keys.length
    total_cost / number_of_participants
  end

  def owed
    amount_owed = Hash.new(0)
    @participants.each do |person, amount_paid|
      amount_owed[person] = split - amount_paid
    end
    amount_owed
  end



end
