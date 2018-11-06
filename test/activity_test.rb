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



end
