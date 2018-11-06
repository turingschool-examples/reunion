class Activity
  attr_reader :name,
              :participants
  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(participant_name, cost)
    @participants[participant_name] = cost
  end

  def total_cost
    total = 0
    @participants.each do |participant, cost|
      total += cost
    end
    total
  end

  def split
    total_participants = @participants.length
    total_cost / total_participants
  end

  def owed
    owed_collection = Hash.new(0)
    split_value = split
    @participants.each do |participant, cost|
      owed_collection[participant] = split_value - cost
    end
    owed_collection
  end

end
