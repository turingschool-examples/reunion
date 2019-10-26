class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

  def add_participant(name, amount_paid)
    @participants[name] = amount_paid
  end

  def total_cost
    @participants.values.sum
  end

  def split
    total_cost / @participants.length
  end

  def owed
    @participants.reduce({}) do |accumulator, participant|
      accumulator[participant[0]] = (split - participant[1])
      accumulator
    end
  end

  def payees_for(participant)
    if owed[participant] < 0
      participants.keys.select do |participant|
        owed[participant] > 0
      end
    elsif owed[participant] > 0
      participants.keys.select do |participant|
        owed[participant] < 0
      end
    end
  end

  def amount_owed_per_payee(participant)
    owed[participant] / payees_for(participant).length
  end
end
