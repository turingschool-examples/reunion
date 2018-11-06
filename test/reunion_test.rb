require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new("1406 BE")

    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_name
    reunion = Reunion.new("1406 BE")

    assert_equal "1406 BE", reunion.name
  end

  def test_it_starts_with_an_empty_array_for_activities
    reunion = Reunion.new("1406 BE")

    assert_equal [], reunion.activities
  end

  def test_activity_objects_can_be_added
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")

    reunion.add_activity(activity_1)
    assert_equal [activity_1], reunion.activities
  end

end

# reunion = Reunion.new("1406 BE")
# # => #<Reunion:0x007fe4ca1defc8 ...>
#
# reunion.name
# # => "1406 BE"
#
# reunion.activities
# # => []
#
# activity_1 = Activity.new("Brunch")
# # => #<Activity:0x007fe4ca1d9438 ...>
#
# reunion.add_activity(activity_1)
#
# reunion.activities
# # => [#<Activity:0x007fe4ca1d9438 ...>]
