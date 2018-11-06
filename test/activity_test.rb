require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < MiniTest::Test

  def test_it_exists
    act = Activity.new("Stuff")

    assert_instance_of Activity, act
  end

  def test_it_can_add_participants
    act = Activity.new("Stuff")
    act.add_participant("maria", 20)
    part = {"maria" => 20}

    assert_equal part, act.participants
  end

  def test_it_can_get_total_cost
    act = Activity.new("Stuff")
    act.add_participant("maria", 20)

    assert_equal 20, act.total_cost

    act.add_participant("steve", 20)
    part = {"maria" => 20, "steve" => 20}

    assert_equal 40, act.total_cost
    assert_equal part, act.participants
  end
end
