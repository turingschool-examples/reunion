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

  def total_cost # sum enumerable is now not working for me
    all_activities_cost = 0
    @activities.each do |activity|
      all_activities_cost += activity.total_cost
    end
    all_activities_cost
  end

  def breakout
    # final_breakdown = Hash.new(0)
    @activities.reduce(Hash.new(0)) do |final_breakdown, activity|
      activity.owed.each do |participant, cost|
        final_breakdown[participant] += cost
      end
      final_breakdown
    end
  end
end
