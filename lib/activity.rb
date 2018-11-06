class Activity

  attr_reader :name,
              :participants

  def initialize(activity_type)
    @name = activity_type
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

end
