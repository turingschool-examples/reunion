class Reunion
  attr_reader   :name,
                :activities

  def initialize(name)
    @name       = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    breakdown = Hash.new(0)
    @activities.each do |activity|
      breakup = activity.owed
      breakup.each do |participant|
        breakdown[participant[0]] += participant[1]
      end
    end
    breakdown
  end

  def summary
    look_nice = breakout.map do |key, value|
      "#{key}: #{value}\n"
    end
    look_nice.join
  end
end
