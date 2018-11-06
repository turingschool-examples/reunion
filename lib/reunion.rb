class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    total_cost = 0
    @activities.each do |activity|
      total_cost += activity.total_cost
    end
    total_cost
  end

  def breakout
    breakout_hash = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |key, value|
        breakout_hash[key] += value
      end
    end
    breakout_hash
  end

  def summary
    summary_string = ""
    breakout.each do |key, value|
      summary_string << "#{key}: #{value}\n"
    end
    summary_string.chomp
  end

  def detailed_breakout
  end
end
