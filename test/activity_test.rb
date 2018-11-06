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

  def test_participants_starts_as_an_empty_hash
    activity = Activity.new("Brunch")
    expected = {}
    assert_equal expected, activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    expected = {"Maria" => 20}
    assert_equal expected, activity.participants
  end

  def test_it_can_get_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal 20, activity.total_cost
  end

  def test_it_can_add_multiple_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expected = {"Maria" => 20, "Luther" => 40}
    assert_equal expected, activity.participants
  end

  def test_it_can_split_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal 30 , activity.split
  end

  def test_it_can_return_hash_of_amounts_owed
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expected = {"Maria" => 10, "Luther" => -10}
    assert_equal expected, activity.owed
  end

end
