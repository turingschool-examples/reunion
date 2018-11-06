require "pry"
class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @participants = {}
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
    share = total_cost - split
    owed_hash = {}
    @participants.map do |person, money|
      owed_hash[person] = (split - money)#(share - money)
    end
    owed_hash
  end


end
