class Activity

  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(name, paid)
    @participants[name] += paid
  end

  def total_cost
    # @participants.find do |person, cost|
    #   cost
    # end.sum
    @participants.values.first
  end

end
