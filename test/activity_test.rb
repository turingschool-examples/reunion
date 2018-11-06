require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new
  end

  def test_it_exists
    assert_instance_of Activity, @activity
  end
end
