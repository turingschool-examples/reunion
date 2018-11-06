require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
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

  def test_it_has_empty_participants_hash
    activity = Activity.new("Brunch")
    assert_equal ({}), activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)

    actual   = activity.participants
    expected = {"Maria" => 20}
    assert_equal expected, actual
  end

  def test_it_knows_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal 20, activity.total_cost
  end

  def test_it_can_add_multiple_participants_and_know_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    expected = {"Maria" => 20, "Luther" => 40}
    actual   = activity.participants
    assert_equal expected, actual

    assert_equal 60, activity.total_cost
  end

  def test_it_can_split_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal 30, activity.split
  end

  def test_knows_amount_owed_for_each_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    actual   = activity.owed
    expected = {"Maria" => 10, "Luther" => -10}
    assert_equal expected, actual
  end

end
