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
    test = {}
    @activities.each do |activity|
      test.merge!(activity.owed){|k, oldv, newv| oldv + newv}
    end
    test
  end

  def summary
    summary_string = ""
    breakout.each_pair do |k, v|
      summary_string += "#{k}: #{v}\n"
    end
    summary_string.chomp
  end
end
