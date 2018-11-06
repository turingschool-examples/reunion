class Activity
  attr_reader   :name,
                :participants

  def initialize(name)
    @name         = name
    @participants = Hash.new(0)
  end

  def add_participant(participant, total_cost)
    @participants[participant] = total_cost
    @participants
  end

  def total_cost
    @participants.sum do |participant|
      participant[1]
    end
  end

  def split
    how_many = @participants.count do |participant|
      participant
    end
    total_cost / how_many
  end

  def owed
    new_list = Hash.new(0)
    @participants.each do |key, value|
      new_list[key] += split - value
    end
    new_list
  end

  def patty_names
    @participants.map do |participant|
      participant[0]
    end
  end
end
