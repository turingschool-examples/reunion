require "minitest/autorun"
require "minitest/pride"
require "./lib/reunion"
require "./lib/activity"

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1810 BE")
    @activity_1 = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_name
    assert_equal "1810 BE", @reunion.name
  end

  def test_it_has_activities
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activity
    assert_equal [@activity_1], @reunion.add_activity(@activity_1)
  end

  def test_it_can_track_total_cost
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)

    assert_equal 60, @reunion.total_cost
    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)

    assert_equal 180, @reunion.total_cost
  end

  def test_it_can_breakout_total_cost_per_person
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)

    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)

    expected = ({"Maria" => -10, "Luther" => -30, "Louis" => 40})
    assert_equal expected, @reunion.breakout
  end

  def test_it_can_show_summary
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)

    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)

    expected = "Maria: -10\nLuther: -30\nLouis: 40"
    assert_equal expected, @reunion.summary
  end

  def test_it_can_give_a_detailed_breakout
    skip
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)

    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)

    @activity_3 = Activity.new("Bowling")
    @activity_3.add_participant("Maria", 0)
    @activity_3.add_participant("Luther", 0)
    @activity_3.add_participant("Louis", 30)

    @activity_4 = Activity.new("Jet Skiing")
    @activity_4.add_participant("Maria", 0)
    @activity_4.add_participant("Luther", 0)
    @activity_4.add_participant("Louis", 40)
    @activity_4.add_participant("Nemo", 40)

    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)
    @reunion.add_activity(@activity_3)
    @reunion.add_activity(@activity_4)




    expected = {
                "Maria" => [
                  {
                    activity: "Brunch",
                    payees: ["Luther"],
                    amount: 10
                  },
                  {
                    activity: "Drinks",
                    payees: ["Louis"],
                    amount: -20
                  },
                  {
                    activity: "Bowling",
                    payees: ["Louis"],
                    amount: 10
                  },
                  {
                    activity: "Jet Skiing",
                    payees: ["Louis", "Nemo"],
                    amount: 10
                  }
                ],
                "Luther" => [
                  {
                    activity: "Brunch",
                    payees: ["Maria"],
                    amount: -10
                  },
                  {
                    activity: "Drinks",
                    payees: ["Louis"],
                    amount: -20
                  },
                  {
                    activity: "Bowling",
                    payees: ["Louis"],
                    amount: 10
                  },
                  {
                    activity: "Jet Skiing",
                    payees: ["Louis", "Nemo"],
                    amount: 10
                  }
                ],
                "Louis" => [
                  {
                    activity: "Drinks",
                    payees: ["Maria", "Luther"],
                    amount: 20
                  },
                  {
                    activity: "Bowling",
                    payees: ["Maria", "Luther"],
                    amount: -10
                  },
                  {
                    activity: "Jet Skiing",
                    payees: ["Maria", "Luther"],
                    amount: -10
                  }
                ],
                "Nemo" => [
                  {
                    activity: "Jet Skiing",
                    payees: ["Maria", "Luther"],
                    amount: -10
                  }
                ]
              }
    assert_equal expected, @reunion.detailed_breakout
  end

  def test_it_can_track_peoples_activities
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)

    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)

    @activity_3 = Activity.new("Bowling")
    @activity_3.add_participant("Maria", 0)
    @activity_3.add_participant("Luther", 0)
    @activity_3.add_participant("Louis", 30)

    @activity_4 = Activity.new("Jet Skiing")
    @activity_4.add_participant("Maria", 0)
    @activity_4.add_participant("Luther", 0)
    @activity_4.add_participant("Louis", 40)
    @activity_4.add_participant("Nemo", 40)

    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)
    @reunion.add_activity(@activity_3)
    @reunion.add_activity(@activity_4)

    assert_equal [@activity_1, @activity_2, @activity_3, @activity_4], @reunion.activities_by_person("Maria")
  end

  def test_it_can_find_payees_per_activity
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)

    @activity_2 = Activity.new("Drinks")
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)

    @activity_3 = Activity.new("Bowling")
    @activity_3.add_participant("Maria", 0)
    @activity_3.add_participant("Luther", 0)
    @activity_3.add_participant("Louis", 30)

    @activity_4 = Activity.new("Jet Skiing")
    @activity_4.add_participant("Maria", 0)
    @activity_4.add_participant("Luther", 0)
    @activity_4.add_participant("Louis", 40)
    @activity_4.add_participant("Nemo", 40)

    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)
    @reunion.add_activity(@activity_3)
    @reunion.add_activity(@activity_4)


    assert_equal ["Luther"], @reunion.find_payees("Maria", @activity_1)
  end



end
