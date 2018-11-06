require 'pry'
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
   total_owed = Hash.new(0)
   owned_for_each_activity.each do |hash|
     hash.map do |key, value|
       total_owed[key] += value
     end
   end
   total_owed
  end

  def owned_for_each_activity
    @activities.map do |activity|
      activity.owed.inject(Hash.new(0)) do |total_owed_for_activity, (key, value)|
        total_owed_for_activity[key] = activity.owed
      end
    end
  end

  def summary
     "Maria: #{breakout["Maria"]} \n-Luther: #{breakout["Luther"]} \n-Louis: #{breakout["Louis"]}"
  end
end


# pry(main)> activity_1 = Activity.new("Brunch")
#
# pry(main)> activity_1.add_participant("Maria", 20)
#
# pry(main)> activity_1.add_participant("Luther", 40)
#
# pry(main)> reunion.add_activity(activity_1)
#
# pry(main)> reunion.total_cost
# # => 60
#
# pry(main)> activity_2 = Activity.new("Drinks")
#
# pry(main)> activity_2.add_participant("Maria", 60)
#
# pry(main)> activity_2.add_participant("Luther", 60)
#
# pry(main)> activity_2.add_participant("Louis", 0)
#
# pry(main)> reunion.add_activity(activity_2)
#
# pry(main)> reunion.total_cost
# # => 180
#
# pry(main)> reunion.breakout
# # => {"Maria" => -10, "Luther" => -30, "Louis" => 40}
#
# pry(main)> reunion.summary
# # => "Maria: -10\nLuther: -30\nLouis: 40"
#
# pry(main)> puts reunion.summary
# Maria: -10
# Luther: -30
# Louis: 40
# ```
