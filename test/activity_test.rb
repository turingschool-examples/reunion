require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test

  def test_an_activity_exist
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end

  def test_an_activity_has_a_name
    activity = Activity.new("Brunch")
    assert_equal "Brunch", activity.name
  end

  def test_an_activity_has_no_participants_by_default
    activity = Activity.new("Brunch")
    assert_equal ({}), activity.participants
  end

  def test_an_activity_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), activity.participants
  end
end
