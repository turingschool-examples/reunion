require './lib/activity'
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
    @activities.map do |activity|
      activity.total_cost
    end.sum
  end

  def breakout
    final_breakout = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |key, value|
        final_breakout[key] += value
      end
    end
    final_breakout
  end

  def summary
    breakout_collection = breakout
    final_summary = []
    breakout_collection.each do |pair|
      final_summary << "#{pair[0]}: #{pair[1]}"
    end
    final_summary.join("\n")
  end



  def detailed_breakout
    all = Hash.new(0)
    @activities.each do |activity|
      activity.participants.each do |key, value|
        all[key] = []
      end
    end
    @activities.each do |activity|
      activity.participants.each do |key, value|
        all[key] << {activity: activity.name,
                     payees: payees(key, activity.name),
                     amount: pay_amount(key, activity.name)}
      end
    end
    all
  end

  def payees(participant, activity_name)
    this_activity = @activities.find do |activity|
      activity.name == activity_name
    end
    amounts = this_activity.owed
    payees = []
    amounts.each do |key, value|
      if pair[1] < 0
        payees << pair[0]
      end
    end
    payees
  end

  def pay_amount(participant, activity_name)
    this_activity = @activities.find do |activity|
      activity.name == activity_name
    end
    amounts = this_activity.owed
    payees = []
    amounts.each do |pair|
      if pair[1] < 0
        payees << pair[0]
      end
    end
    pay_amount = (amounts[participant] / payees.length)
  end

end
