class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_particpant(participant)
    @participants.merge!(participant)
  end

  def total_cost
    @participants.values.sum
  end

end
