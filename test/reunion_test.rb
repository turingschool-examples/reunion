require "minitest/autorun"
require "minitest/pride"
require "./lib/reunion"
require "./lib/activity"

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1810 BE")
    @activity_1 = Activity.new("Brunch")
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
    assert_equal [@activity_1], @reunion.add_activity(@activity_1)
  end

  def test_it_can_breakout_costs
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)

    assert_equal 60, @reunion.total_cost
    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)

    assert_equal 180, @reunion.total_cost
  end

end
