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
    @activities.sum { |activity| activity.total_cost }
  end

  def breakout
    total_owed = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |name, amount_owed|
        total_owed[name] += amount_owed
      end
    end
    total_owed
  end

  def summary
    return_string = ""
    breakout.each do |name, amount|
      return_string << "#{name}: #{amount}\n"
    end
    return_string.chomp
  end

  def detailed_breakout
    all_activities_owed = Hash.new() {Array.new}
    @activities.each do |activity|
      activity.owed_to.each do |name, detailed_owe|
        new_array = all_activities_owed[name] << detailed_owe
        all_activities_owed[name] = new_array
      end
    end
    all_activities_owed
  end

end
