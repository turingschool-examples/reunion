require 'minitest/autorun'
require 'minitest/pride'

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
end
