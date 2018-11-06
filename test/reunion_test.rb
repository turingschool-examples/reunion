require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < MiniTest::Test

  def test_it_exists
    reunion = Reunion.new("1406 BE")

    assert_instance_of Reunion, reunion
  end

  def test_it_has_name_and_activities
    reunion = Reunion.new("1406 BE")

    assert_equal "1406 BE", reunion.name
    assert_equal [], reunion.activities
  end

  def test_it_can_add_activites
    reunion = Reunion.new("1406 BE")
    act_1 = Activity.new("Brunch")
    reunion.add_activity(act_1)

    assert_equal [act_1], reunion.activities
  end

  def test_it_can_total_acticity_costs
    reunion = Reunion.new("1406 BE")
    act_1 = Activity.new("Brunch")
    act_2 = Activity.new("lunch")
    act_1.add_participant("Maria", 20)
    act_1.add_participant("Luther", 40)
    reunion.add_activity(act_1)

    assert_equal 60, reunion.total_cost

    act_2.add_participant("Maria", 60)
    act_2.add_participant("Luther", 60)
    act_2.add_participant("Louis", 0)
    reunion.add_activity(act_2)

    assert_equal 180, reunion.total_cost
  end
end
