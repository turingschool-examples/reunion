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

  def test_it_has_a_name
    assert_equal "Brunch", @activity.name
  end

  def test_it_starts_with_empty_participants
    assert_equal 0, @activity.participants.count
    assert_equal Hash, @activity.participants.class
  end

  def test_it_can_add_participants
    assert_equal 0, @activity.participants.count

    @activity.add_participant("Maria", 20)

    expected = { "Maria" => 20 }

    assert_equal 1, @activity.participants.count
    assert_equal expected, @activity.participants
  end

  def test_it_can_give_total_cost
    assert_equal 0, @activity.total_cost

    @activity.add_participant("Maria", 20)
    @activity.add_participant("Dave", 40)

    assert_equal 60, @activity.total_cost
  end
end
