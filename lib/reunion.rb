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
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    breakout_hash = Hash.new(0)
    @activities.each do |activity|
      activity.owed.map do |person, amount|
        breakout_hash[person] += amount
      end
    end
    breakout_hash
  end

  def summary
    breakout.map do |person, amount|
      p "#{person}: #{amount}"
    end.join("\n")
  end

  def owed_amount
    new_hash = {}
    new_hash[activity] = 0
    new_hash[payees] = 0
    new_hash[amount] = 0
    @activities.each do |activity_obj|
      activity_obj.owed.each do |person, amt|
        if amt < 0
          new_amt = amt.abs
          new_hash[amount] += new_amt
          new_hash[payees] += person
        end
      end
    end
  end

  def detailed_breakout
    @activities.each do |activity_obj|
      owed_amount
      activity = activity_obj.name
      new_hash[activity] += activity.name
    end
  end

end


# def total_cost
#   cost_array = @activities.map do |activity|
#      activity.total_cost
#   end
#   cost_array.sum
# endg
