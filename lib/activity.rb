







# ```ruby
# pry(main)> require './lib/activity'
# # => true
#
# pry(main)> activity = Activity.new("Brunch")
# # => #<Activity:0x007fe4ca1df568 ...>
#
# pry(main)> activity.name
# # => "Brunch"
#
# pry(main)> activity.participants
# # => {}
#
# pry(main)> activity.add_participant("Maria", 20)
#
# pry(main)> activity.participants
# # => {"Maria" => 20}
#
# pry(main)> activity.total_cost
# # => 20
#
# pry(main)> activity.add_participant("Luther", 40)
#
# pry(main)> activity.participants
# # => {"Maria" => 20, "Luther" => 40}
# ```
