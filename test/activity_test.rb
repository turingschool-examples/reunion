require './lib/activity'
require 'minitest/autorun'
require 'minitest/emoji'
require 'pry'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("Brunch")

    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new("Brunch")

    assert_equal "Brunch", activity.name
  end

  def test_it_starts_with_no_participants
    activity = Activity.new("Brunch")

    assert_equal ({}), activity.participants
  end

  def test_it_can_add_a_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), activity.participants
  end

  def test_it_can_check_the_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)

    assert_equal 20, activity.total_cost
  end

  def test_it_can_add_more_participants_and_check_the_total_cost_and_split_it
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal 60, activity.total_cost
    assert_equal 30, activity.split
  end

  def test_it_can_add_more_participants_and_see_how_much_each_owes
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal 60, activity.total_cost
    assert_equal ({"Maria" => 10, "Luther" => -10}), activity.owed
  end

end
