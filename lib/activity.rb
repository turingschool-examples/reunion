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
    @participants.values.sum
  end

  def split
    total_cost / @participants.count
  end

  def owed
    split_amount = split
    @participants.inject({}) do |owed, (person, cost)|
      owed[person] = split_amount - cost
      owed
    end
  end

  def find_payees(name)
    owed.inject([]) do |payees, (person, amount_owed)|
      if owed[name] > 0
        payees << person if amount_owed <= 0
      else
        payees << person if amount_owed > 0
      end
      payees
    end
  end
end
