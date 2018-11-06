class Reunion

attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity_name)
    @activities << activity_name
  end

  def total_cost
    @activities.inject(0) do |sum, activity|
      sum += activity.total_cost
      sum
    end
  end

  def breakout
    payment = @activities.group_by do |activity|
      activity.owed#(participants[:name])
    end
    payment
  end
end
