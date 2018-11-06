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
   almost_there = @activities.map do |activity|
     activity.owed.transform_values do |owe|
       owe
     end
   end
   almost_there[0].merge(almost_there[1]) do |key, oldval, newval|
     oldval + newval
   end
 end

 def summary
   initial = breakout.to_s.gsub(/[^\w,-]{1,}/, "")
   reformat = initial.gsub(",", "\n")
   reformat.insert(5, ": ")
   reformat.insert(17, ": ")
   reformat.insert(28, ": ")
   "#{reformat}"
 end
end
