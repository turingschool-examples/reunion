require './lib/activity'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("Brunch")

    assert_instance_of Activity, activity
  end

end


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
