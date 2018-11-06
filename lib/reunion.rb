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
    @activities.sum {|activity| activity.total_cost}
  end

  def breakout
    split_by_activiy = @activities.map do |activity|
      activity.owed
    end
    split_by_activiy[0].merge(split_by_activiy[1]){|key, old_val, new_val| old_val + new_val}
  end

  def summary
    breakout.each do |item|
      "#{item.name}: #{item.cost}\n"
    end
  end

end
