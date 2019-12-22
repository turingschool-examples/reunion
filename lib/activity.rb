class Activity
attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost
    total_cost = 0
    @participants.map do |participant, cost|
      total_cost += cost
    end
    total_cost
  end

  def split
    total_cost / @participants.length
  end

  # def owed
  #   @participants.reduce({}) do |new_hash, participant_cost_array|
  #     new_hash[participant_cost_array[0]] = split - participant_cost_array[1]
  #     new_hash
  #   end
  # end
  def owed #we set owed equal to participants after initializing it and returned this {"Maria"=>20, "Luther"=>40}
    owed = Hash.new(0)
    @participants.each do |name, cost|
      owed[name] = split - cost
    end
    owed
  end
end
