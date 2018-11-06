require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end

  def test_name
    activity = Activity.new("Brunch")
    assert_equal "Brunch", activity.name
  end

  def test_participants_is_empty_hash
    activity = Activity.new("Brunch")
    assert_equal ({}), activity.participants
  end

  def test_add_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), activity.participants

    activity.add_participant("Luther", 40)
    assert_equal ({"Maria" => 20, "Luther" => 40}), activity.participants
  end

  def test_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal 20, activity.total_cost

    activity.add_participant("Luther", 40)
    assert_equal 60, activity.total_cost
  end

  def test_split
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal 30, activity.split
  end

  def test_owed_money
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal ({"Maria" => 10, "Luther" => -10}), activity.owed
  end

end
