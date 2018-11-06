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
    activity.add_participant("Luther", 40)
    assert_equal ({"Maria" => 20, "Luther" => 40}), activity.participants
  end

  def test_an_activity_can_calculate_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal 20, activity.total_cost
    activity.add_participant("Luther", 40)
    assert_equal 60, activity.total_cost
  end

  def test_an_activity_can_calculate_the_split
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal 2, activity.number_of_participants
    assert_equal 30, activity.split
  end

  def test_an_activity_can_calculate_ammount_owed
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal ({"Maria" => 10, "Luther" => -10}), activity.owed
  end
end
