require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < MiniTest::Test

  def test_it_exists
    act = Activity.new("Stuff")

    assert_instance_of Activity, act
  end
end
