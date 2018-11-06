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
    @activities.inject(0) {|total_cost, activity| total_cost + activity.total_cost}
  end
end
