require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
class ActivityTest < Minitest::Test

  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Activity, @activity
    assert_equal "Brunch", @activity.name
    assert_equal ({}), @activity.participants
  end

  def test_add_participant
    @activity.add_participant("Maria", 20)

    expected = {"Maria" => 20}

    assert_equal expected, @activity.participants
  end

  def test_total_cost
    @activity.add_participant("Maria", 20)

    assert_equal 20, @activity.total_cost

    @activity.add_participant("Luther", 40)

    expected = {"Maria" => 20, "Luther" => 40}

    assert_equal expected, @activity.participants
    assert_equal 60, @activity.total_cost
  end

  def test_split_and_owed
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    assert_equal 30, @activity.split

    expected = {"Maria" => 10, "Luther" => -10}

    assert_equal expected, @activity.owed
  end
end
