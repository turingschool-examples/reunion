require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
  end

  def test_it_has_a_name
    assert_equal "1406 BE", @reunion.name
  end

  def test_it_has_no_activities_to_start
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activities
    assert_equal [], @reunion.activities

    @reunion.add_activity(@activity_1)

    assert_equal [@activity_1], @reunion.activities
  end

  def test_it_can_return_total_cost
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    @reunion.add_activity(activity_2)

    assert_equal 180, @reunion.total_cost
  end

  def test_it_returns_a_breakout_and_summary_of_final_amount_owed_for_each_participant
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)

    @reunion.add_activity(@activity_1)
    assert_equal 60, @reunion.total_cost

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    @reunion.add_activity(activity_2)

    assert_equal 180, @reunion.total_cost

    expected = {"Maria" => -10, "Luther" => -30, "Louis" => 40}
    expected_summary = "Maria: -10\nLuther: -30\nLouis: 40"

    assert_equal expected, @reunion.breakout
    assert_equal expected_summary, @reunion.summary
  end
end
