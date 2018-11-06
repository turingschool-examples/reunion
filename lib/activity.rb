class Activity

  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, money_spent)
    @participants[name] = money_spent
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.keys.count
  end

  def owed
    participants_and_balances = {}
    @participants.each do |name, money_spent|
      participants_and_balances[name] = (split - money_spent)
    end
    participants_and_balances
  end
end
