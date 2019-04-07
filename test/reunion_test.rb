require "minitest/autorun"
require "./lib/reunion"

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_a_name
    assert_equal @reunion.name, "1406 BE"
  end

  def test_it_has_no_activities_by_default
    assert_equal @reunion.activities, []
  end

  def test_it_can_add_activities
    @reunion.add_activity(@activity_1)
    assert_equal @reunion.activities, [@activity_1]
  end
end
