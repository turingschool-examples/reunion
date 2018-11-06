class Activity
  
  attr_reader :name, 
              :participants
  
  def initialize(name)
    @name = name
    @participants = {}
  end
  
  def add_participant(name, paid)
    @participants[name] = paid
  end
  
  def total_cost
    @participants.values.sum
  end
  
  def split
    total_cost / @participants.count
  end
  
  def owed
    participants_owe = {}
    @participants.each do |name, paid|
      participants_owe[name] = split - paid
    end
    participants_owe
  end
  
  def payees(name)
    payees = []
    if @participants[name] < split
      @participants.each do |participant, amount|
        payees << participant if amount >= split
      end 
    else
      @participants.each do |participant, amount|
        payees << participant if amount < split
      end
    end
    # payees.count == 1 ? payees.first : payees
    payees
  end
  
  def payees_breakout
    breakout = {}
    owed.each do |name, amount|
      breakout[name] = {activity: @name, payees: payees(name) , amount: amount / payees(name).count}
    end
    breakout
  end
end