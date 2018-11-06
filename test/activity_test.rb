require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test


  def test_it_exists
    activity = Activity.new("Brunch")

    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new("Brunch")

    assert_equal "Brunch", activity.name
  end

  def test_it_starts_without_participants
    activity = Activity.new("brunch")

    assert_equal ({}), activity.participants
  end

  def test_it_add_participants
    skip
    activity = Activity.new("brunch")
    activity.add_particpant("Maria" => 20)

    assert_equal ({"Maria" => 20}), activity.participants
  end

  def test_it_tracks_total_cost
    skip
    activity = Activity.new("brunch")
    activity.add_particpant("Maria" => 20)
    activity.add_particpant("Luther" => 40)

    assert_equal 60, activity.total_cost
  end

end
