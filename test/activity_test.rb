require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_has_a_name
    assert_equal "Brunch", @activity.name
  end

  def test_it_has_no_participants_to_start
    assert_equal ({}), @activity.participants
  end

  def test_it_can_add_participants
    assert_equal ({}), @activity.participants

    @activity.add_participant("Maria", 20)

    expected = {"Maria" => 20}
    assert_equal expected, @activity.participants
  end

  def test_it_can_add_multiple_participants
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    expected = {"Maria" => 20, "Luther" => 40}

    assert_equal expected, @activity.participants
  end

  def test_it_can_return_total_cost
    @activity.add_participant("Maria", 20)

    assert_equal 20, @activity.total_cost
  end

  def test_it_returns_split_a_participant_should_pay_given_total_cost
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    assert_equal 60, @activity.total_cost
    assert_equal 30, @activity.split
  end

  def test_it_returns_participants_and_amount_owed
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    assert_equal 30, @activity.split
    expected = {"Maria" => 10, "Luther" => -10}

    assert_equal expected, @activity.owed
  end

end
