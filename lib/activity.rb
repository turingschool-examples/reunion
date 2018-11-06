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
    owed_list = owed
    participant_amount = owed_list.delete(name)
    find_who_owes(owed_list, participant_amount).keys
  end
  
  def find_who_owes(owed_list, participant_amount)
    if participant_amount < 0
      owed_list.delete_if do |n, amount|
        amount < 0
      end
    else 
      owed_list.delete_if do |n, amount|
        amount > 0
      end
    end
  end
  
  def payees_breakout
    breakout = {}
    owed.each do |name, amount|
      breakout[name] = {activity: @name, 
                        payees: payees(name), 
                        amount: amount / payees(name).count}
    end
    breakout
  end
end