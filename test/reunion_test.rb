require "minitest/autorun"
require "minitest/pride"
require "./lib/reunion"
require "./lib/activity"

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1810 BE")
    @activity = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_name
    assert_equal "1810 BE", @reunion.name
  end

  def test_it_has_activities
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activity
    assert_equal [@activity], @reunion.add_activity(@activity)
  end

end
