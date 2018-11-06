# ```ruby
# pry(main)> require './lib/reunion'
# # => true
#
# pry(main)> reunion = Reunion.new("1406 BE")
# # => #<Reunion:0x007fe4ca1defc8 ...>
#
# pry(main)> reunion.name
# # => "1406 BE"
#
# pry(main)> reunion.activities
# # => []
#
# pry(main)> activity_1 = Activity.new("Brunch")
# # => #<Activity:0x007fe4ca1d9438 ...>
#
# pry(main)> reunion.add_activity(activity_1)
#
# pry(main)> reunion.activities
# # => [#<Activity:0x007fe4ca1d9438 ...>]
# ```
