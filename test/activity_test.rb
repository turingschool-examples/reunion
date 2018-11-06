require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end

  def test_it_has_attributes
    activity = Activity.new("Brunch")
    assert_equal "Brunch", activity.name
  end

  def test_participants_starts_with_empty_hash
    activity = Activity.new("Brunch")
    empty_hash = {}
    assert_equal empty_hash, activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    expected = {"Maria" => 20}
    assert_equal expected, activity.participants
    assert_equal 20, activity.total_cost
  end

  def test_it_can_have_multiple_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expected = {"Maria" => 20, "Luther" => 40}
    assert_equal expected, activity.participants
  end

  def test_it_can_split_activity_costs_by_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal 30, activity.split
  end

  def test_it_can_return_amount_owed_to_each_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    activity.split
    expected = {"Maria" => 10, "Luther" => -10}
    assert_equal expected, activity.owed
  end
end
