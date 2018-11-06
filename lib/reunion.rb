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
    @activities.map do |activity|
      activity.total_cost
    end.sum
  end

  def breakout_array
    @activities.map do |activity|
      activity.owed
    end
  end

  def breakout
    breakout_hash = Hash.new(0)
    breakout_array.map do |totals|
      totals.each do |key, value|
        if breakout_hash.keys.include?(key)
          breakout_hash[key] += (value * -1)
        else
          breakout_hash[key] = (value * -1)
        end
      end
    end
    breakout_hash
  end


end
