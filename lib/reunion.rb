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
    @activities.map do |person|
        person.total_cost
    end.flatten.sum
  end

  def breakout
    @activities.map do |activity|
      # binding.pry
      activity.split
    end
  end
end
