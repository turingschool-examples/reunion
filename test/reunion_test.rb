require "minitest/autorun"
require "./lib/reunion"
require "./lib/activity"
class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1406 BE")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_a_name
    assert_equal "1406 BE", @reunion.name
  end

  def test_it_starts_with_an_activity_array
    assert_equal [], @reunion.activities
  end

  def test_you_can_add_an_activity
    activity_1 = Activity.new("brunch")
    @reunion.add_activity(activity_1)
    assert_equal [activity_1], @reunion.activities
  end

  def test_you_can_add_activities
    activity_1 = Activity.new("brunch")
    activity_2 = Activity.new("lunch")
    @reunion.add_activity(activity_1)
    @reunion.add_activity(activity_2)
    assert_equal [activity_1, activity_2], @reunion.activities
  end

end
