require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")
    @activity_3 = Activity.new("Bowling")
    @activity_4 = Activity.new("Jet Skiing")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_initializes
    assert_equal "1406 BE", @reunion.name
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activity
    @reunion.add_activity(@activity_1)
    assert_equal [@activity_1], @reunion.activities
  end

  def test_it_can_calculate_total_cost_of_all_activities
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    assert_equal 180, @reunion.total_cost
  end

  def test_it_can_calculate_individual_total_owed
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    assert_equal -10, @reunion.individual_breakout("Maria")
    assert_equal -30, @reunion.individual_breakout("Luther")
    assert_equal 40, @reunion.individual_breakout("Louis")
  end

  def test_it_can_get_all_participants
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    assert_equal ["Maria", "Luther", "Louis"], @reunion.all_participants
  end

  def test_it_can_calculate_breakout_of_amounts_owed
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    expected_hash = {"Maria" => -10, "Luther" => -30, "Louis" => 40}
    assert_equal expected_hash, @reunion.breakout
  end

  def test_it_can_format_breakout_summary_for_printing
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @reunion.add_activity(@activity_1)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @reunion.add_activity(@activity_2)
    assert_equal "Maria: -10\nLuther: -30\nLouis: 40", @reunion.summary
  end

  def test_it_can_provide_individual_detailed_breakout
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @activity_3.add_participant("Maria", 0)
    @activity_3.add_participant("Luther", 0)
    @activity_3.add_participant("Louis", 30)
    @activity_4.add_participant("Maria", 0)
    @activity_4.add_participant("Luther", 0)
    @activity_4.add_participant("Louis", 40)
    @activity_4.add_participant("Nemo", 40)
    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)
    @reunion.add_activity(@activity_3)
    @reunion.add_activity(@activity_4)
    expected_hash = {
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
                      ]
                    }
    assert_equal expected_hash, @reunion.ind_detailed_breakout("Maria")
  end

  def test_it_can_provide_detailed_breakout
    @activity_1.add_participant("Maria", 20)
    @activity_1.add_participant("Luther", 40)
    @activity_2.add_participant("Maria", 60)
    @activity_2.add_participant("Luther", 60)
    @activity_2.add_participant("Louis", 0)
    @activity_3.add_participant("Maria", 0)
    @activity_3.add_participant("Luther", 0)
    @activity_3.add_participant("Louis", 30)
    @activity_4.add_participant("Maria", 0)
    @activity_4.add_participant("Luther", 0)
    @activity_4.add_participant("Louis", 40)
    @activity_4.add_participant("Nemo", 40)
    @reunion.add_activity(@activity_1)
    @reunion.add_activity(@activity_2)
    @reunion.add_activity(@activity_3)
    @reunion.add_activity(@activity_4)
    expected_hash = {
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
    assert_equal expected_hash, @reunion.detailed_breakout
  end
end
