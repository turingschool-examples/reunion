class Activity

  attr_reader :name,
              :participants,
              :total_cost,
              :owed

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

  def split
    self.total_cost / @participants.count
  end

  def owed
    debt_amt = {}
    @participants.map do |person,paid|
        debt_amt[person] = (self.split - paid)
    end
    debt_amt
  end
end
