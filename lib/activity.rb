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
    @participants.map do |person,paid|
        paid
    end.flatten.sum
  end

end
