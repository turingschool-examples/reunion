class Reunion

  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
    @breakout = {}
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    activities.sum{|activity| activity.total_cost}
  end

  def breakout
    @activities.each do |activity|
      @breakout.merge!(activity.owed){|k, oldv, newv| oldv + newv}
    end
    @breakout
  end

  def summary

  end
end
