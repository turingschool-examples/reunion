require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("Brunch")

    assert_instance_of Activity, activity
  end

  def test_that_it_is_initialized_with_a_name
    activity = Activity.new("Brunch")

    assert_equal "Brunch", activity.name
  end

  def test_that_it_starts_with_an_empty_hash_for_participants
    activity = Activity.new("Brunch")

    assert_equal ({}), activity.participants
  end

  def test_that_it_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)

    assert_equal ({"Maria" => 20}), activity.participants

    activity.add_participant("Luther", 40)

    assert_equal ({"Maria" => 20, "Luther" => 40}), activity.participants
  end

  def test_that_it_can_find_total_cost_of_activity
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)

    assert_equal 20, activity.total_cost

    activity.add_participant("Luther", 40)

    assert_equal 60, activity.total_cost
  end

  def test_that_they_can_split_total_cost_between_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    activity.total_cost

    assert_equal 30, activity.split
  end

  def test_that_it_can_charge_the_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    activity.total_cost
    split_cost = activity.split

    assert_equal ({"Maria" => 10, "Luther" => -10}), activity.owed
  end

end
