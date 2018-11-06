require './lib/reunion'
require './lib/activity'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new("1406 BE")

    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_attributes
    reunion = Reunion.new("1406 BE")

    assert_equal "1406 BE", reunion.name
    assert_equal [], reunion.activities
  end

end

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
