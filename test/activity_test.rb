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
    activity = Activity.new("brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal ({"Maria"=> 20,"Luther" => 40}), activity.participants
  end

  def test_it_tracks_total_cost
    activity = Activity.new("brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal 60, activity.total_cost
  end

  def test_it_splits_total_cost
    activity = Activity.new("brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal 30, activity.split
  end

  def test_it_can_calculate_who_owes_and_is_owed
    activity = Activity.new("brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expected = {"Maria" => 10, "Luther" => -10}

    assert_equal expected, activity.owed
  end

end
