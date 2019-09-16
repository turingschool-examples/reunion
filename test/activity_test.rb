require "minitest/autorun"
require "./lib/activity"

class ActivityTest < Minitest::Test

  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Activity, @activity
  end

  def test_it_has_a_name
    assert_equal @activity.name, "Brunch"
  end

  def test_it_has_no_participants_by_default
    assert_equal @activity.participants, {}
  end

  def test_it_can_add_a_participant
    @activity.add_participant("Maria", 20)
    assert_equal @activity.participants, {"Maria" => 20}
  end

  def test_it_can_find_total_cost
    @activity.add_participant("Maria", 20)
    assert_equal @activity.total_cost, 20
    @activity.add_participant("Luther", 40)
    assert_equal @activity.total_cost, 60
    assert_equal @activity.participants, {"Maria" => 20, "Luther" => 40}
  end

  def test_it_can_split_costs
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    assert_equal @activity.total_cost, 60
    assert_equal @activity.split, 30
    assert_equal @activity.owed, {"Maria" => 10, "Luther" => -10}
  end
end
