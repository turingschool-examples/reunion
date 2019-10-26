require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_initializes
    assert_equal "1406 BE", @reunion.name
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activity
    @reunion.add_activity(@activity_1)
    assert_equal [@activity_1], @reunion.activities
  end

  def test_it_can_calculate_total_cost_of_all_activities
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    assert_equal 180, @reunion.total_cost
  end

  def test_it_can_calculate_individual_total_owed
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    assert_equal -10, @reunion.individual_breakout("Maria")
    assert_equal -30, @reunion.individual_breakout("Luther")
    assert_equal 40, @reunion.individual_breakout("Louis")
  end

  def test_it_can_get_all_participants
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    assert_equal ["Maria", "Luther", "Louis"], @reunion.all_participants
  end

  def test_it_can_calculate_breakout_of_amounts_owed
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    expected_hash = {"Maria" => -10, "Luther" => -30, "Louis" => 40}
    assert_equal expected_hash, @reunion.breakout
  end

  def test_it_can_format_breakout_summary_for_printing
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    assert_equal "Maria: -10\nLuther: -30\nLouis: 40", @reunion.summary
  end
end
