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

end
