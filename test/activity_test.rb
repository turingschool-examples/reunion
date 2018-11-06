require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
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

  def test_it_has_empty_hash_of_participants_by_default
    activity = Activity.new("Brunch")
    expected = {}
    assert_equal expected, activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    expected = {"Maria" => 20}
    assert_equal expected, activity.participants
    activity.add_participant("Luther", 40)
    expected = {"Maria" => 20, "Luther" => 40}
    assert_equal expected, activity.participants
  end

  def test_it_can_find_the_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal 60, activity.total_cost
  end

  def test_it_can_find_the_split_amount
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal 30, activity.split
  end

  def test_it_can_find_who_owes_who
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expected = {"Maria" => 10, "Luther" => -10}
    assert_equal expected, activity.owed
  end
end
