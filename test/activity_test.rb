require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end

  def test_it_starts_with_no_participants_as_empty_hash
    activity = Activity.new("Brunch")
    assert_equal ({}), activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), activity.participants
  end

  def test_it_tracks_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal 20, activity.total_cost
    activity.add_participant("Steven", 60)
    assert_equal 80, activity.total_cost
  end

  def test_it_can_track_multiple_people
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), activity.participants
    activity.add_participant("Luther", 40)
    assert_equal ({"Maria" => 20, "Luther" => 40}), activity.participants
  end



end
