require "minitest/autorun"
require "./lib/reunion"
require "./lib/activity"

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")
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

  def test_it_has_breakout_functionality
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    assert_equal @reunion.total_cost, 60
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    assert_equal @reunion.total_cost, 180
    assert_equal @reunion.breakout, {"Maria" => -10, "Luther" => -30, "Louis" => 40}
  end

  def test_it_has_summery_function
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    assert_equal @reunion.total_cost, 60
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    assert_equal @reunion.summary, "Maria: -10\nLuther: -30\nLouis: 40"
  end
end
