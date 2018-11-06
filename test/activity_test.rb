require "minitest/autorun"
require "./lib/activity"
class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new("Jumping")
  end

  def test_it_exists
    assert_instance_of Activity, @activity
  end

  def test_it_has_a_name
    assert_equal "Jumping", @activity.name
  end

  def test_it_starts_with_a_participant_hash
    assert_equal ({}), @activity.participants
  end

  def test_you_can_add_a_participant
    @activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), @activity.participants
  end

  def test_you_can_add_participants
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    assert_equal ({"Maria" => 20, "Luther" => 40}), @activity.participants
  end

  def test_total_cost_returns_total_cost
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    assert_equal 60, @activity.total_cost
  end

  def test_split_returns_evenly_distributed_cost
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    assert_equal 30, @activity.split
  end

  def test_owed_returns_hash_containing_difference_between_what_they_paid_and_split
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    assert_equal ({"Maria" => 10, "Luther" => -10}), @activity.owed
  end



  #

# activity.total_cost
# => 20

# activity.add_participant("Luther", 40)

# activity.participants
# => {"Maria" => 20, "Luther" => 40}
end
