class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.map do |activity|
       activity.total_cost
      # binding.pry
    end.sum
  end

  def breakout
    breakout_hash = Hash.new(0)
    @activities.each do |activity|
      activity.owed.map do |person, amount|
        breakout_hash[person] += amount
      end
    end
    breakout_hash
  end

  def summary
    breakout.map do |person, amount|
      "#{person}: #{amount}"
    end.join("\n")
  end






end
