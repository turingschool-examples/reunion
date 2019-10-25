require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Activity, @activity
  end

  def test_it_initializes
    assert_equal "Brunch", @activity.name
    empty_hash = {}
    assert_equal empty_hash, @activity.participants
  end

  def test_it_can_add_participants
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    expected_hash = {"Maria" => 20, "Luther" => 40}
    assert_equal expected_hash, @activity.participants
  end

  def test_it_can_get_total_cost_of_participants
    @activity.add_participant("Maria", 20)
    assert_equal 20, @activity.total_cost
    @activity.add_participant("Luther", 40)
    assert_equal 60, @activity.total_cost
  end
end
