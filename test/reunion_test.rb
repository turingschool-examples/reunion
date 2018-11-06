require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1406 BE")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_a_name
    assert_equal "1406 BE", @reunion.name
  end

  def test_it_starts_with_no_activities
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activities
    activity_1 = Activity.new("Brunch")
    @reunion.add_activity(activity_1)

    assert_equal 1, @reunion.activities.count
    assert_equal activity_1, @reunion.activities.last
  end

  def test_it_can_give_total_cost_of_all_activities
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    @reunion.add_activity(activity_1)

    assert_equal 60, @reunion.total_cost

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    @reunion.add_activity(activity_2)

    assert_equal 180, @reunion.total_cost
  end

  def test_it_can_breakout_total_owed
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    @reunion.add_activity(activity_1)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    @reunion.add_activity(activity_2)

    expected = {"Maria" => -10, "Luther" => -30, "Louis" => 40}
    assert_equal expected, @reunion.breakout
  end

  def test_it_can_format_a_summary
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    @reunion.add_activity(activity_1)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    @reunion.add_activity(activity_2)

    expected = "Maria: -10\nLuther: -30\nLouis: 40"
    assert_equal expected, @reunion.summary
  end
end
