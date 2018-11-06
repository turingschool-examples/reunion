require 'minitest/autorun'
require 'minitest/pride'

require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1810 BE")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_a_name
    assert_equal "1810 BE", @reunion.name
  end

  def test_it_defaults_to_no_activities
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_an_activity
    activity_1 = Activity.new("Brunch")
    @reunion.add_activity(activity_1)
    assert_equal [activity_1], @reunion.activities
  end
end
