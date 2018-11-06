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
    @activities.sum(&:total_cost)
  end

  def breakout
    @activities.reduce(Hash.new(0)) do |h, act|
      act.owed.each { |k, v| h[k] += v }
      h
    end
  end

  def summary
    breakout.map { |k, v| "#{k}: #{v}" }.join("\n")
  end
end
