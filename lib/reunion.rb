class Reunion

  attr_reader :name,
              :activities

  def initialize(name)
    @name       = name
    @activities = []
  end

  def add_activity(activity_object)
    @activities << activity_object
  end

  def total_cost
    sum = 0
    @activities.each do |activity|
      activity.participants.each do |name, cost|
        sum += cost
      end
    end
    sum
  end



end
