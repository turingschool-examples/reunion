require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/reunion'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new("1810 BE")

    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_name
    reunion = Reunion.new("1810 BE")

    assert_equal "1810 BE", reunion.name
  end

  def test_it_starts_without_activities
    reunion = Reunion.new("1810 BE")

    assert_equal [], reunion.activities
  end

  def test_it_can_add_activities
    reunion = Reunion.new("1810 BE")
    activity_1 = Activity.new("Brunch")
    reunion.add_activity(activity_1)

    assert_equal [activity_1], reunion.activities
  end
end
