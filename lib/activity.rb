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
end