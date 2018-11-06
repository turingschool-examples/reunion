class Activity

  attr_reader :name,
              :participants

  def initialize(activity_type)
    @name         = activity_type
    @participants = {}
  end

  def add_participant(participant, cost)
    @participants[participant] = cost
  end

  def total_cost
    sum = 0
    @participants.each do |participant, cost|
      sum += cost
    end
    sum
  end

  def split
    total_cost / @participants.keys.count
  end

  def owed
    money_owed = {}

    @participants.each do |participant, cost|
      money_owed[participant] = split - cost
    end

    money_owed
  end

end
