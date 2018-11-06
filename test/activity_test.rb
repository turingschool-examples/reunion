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
    @activity.add_participant("Luther", 40)

    expected = { "Maria" => 20, "Luther" => 40 }

    assert_equal 2, @activity.participants.count
    assert_equal expected, @activity.participants
  end

  def test_it_can_give_total_cost
    assert_equal 0, @activity.total_cost

    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    assert_equal 60, @activity.total_cost
  end

  def test_it_can_split_the_total_cost
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    assert_equal 60, @activity.total_cost
    assert_equal 30, @activity.split
  end

  def test_it_can_show_what_is_owed
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)

    expected = {"Maria" => 10, "Luther" => -10}

    assert_equal expected, @activity.owed
  end

  def test_it_can_find_payees
    @activity.add_participant("Maria", 10)
    @activity.add_participant("Luther", 40)
    @activity.add_participant("James", 10)


    assert_equal ["Luther"], @activity.find_payees("Maria")
  end
end
