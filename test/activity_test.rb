require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end

end
