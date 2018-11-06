require "pry"

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
    end.sum
  end

  def breakout
    final_owed = Hash.new(0)
    owed = @activities.map do |activity|
      activity.owed.each do |person, money|
        final_owed[person] += money
      end
    end
    final_owed
  end
end
