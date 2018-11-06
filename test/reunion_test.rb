require 'minitest/autorun'
require 'minitest/pride'

require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1810 BE")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_a_name
    assert_equal "1810 BE", @reunion.name
  end

  def test_it_defaults_to_no_activities
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_an_activity
    activity_1 = Activity.new("Brunch")
    @reunion.add_activity(activity_1)

    assert_equal [activity_1], @reunion.activities
  end

  def test_it_can_calculate_total_cost
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    @reunion.add_activity(activity_1)

    assert_equal 60, @reunion.total_cost
  end

  def test_it_can_breakout
    activity_1 = Activity.new("Brunch")

    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    @reunion.add_activity(activity_1)

    activity_2 = Activity.new("Drinks")

    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    @reunion.add_activity(activity_2)

    assert_equal 180, @reunion.total_cost
    assert_equal ({ "Maria" => -10, "Luther" => -30, "Louis" => 40 }), @reunion.breakout
  end

  def test_it_can_generate_a_summary
    activity_1 = Activity.new("Brunch")

    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    @reunion.add_activity(activity_1)

    activity_2 = Activity.new("Drinks")

    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    @reunion.add_activity(activity_2)

    assert_equal "Maria: -10\nLuther: -30\nLouis: 40", @reunion.summary
  end

  def test_it_can_generate_a_detailed_breakout
    reunion = Reunion.new("1406 BE")

    # One person owes one person
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    # One person owes two people
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    # Two people owe one person
    activity_3 = Activity.new("Bowling")
    activity_3.add_participant("Maria", 0)
    activity_3.add_participant("Luther", 0)
    activity_3.add_participant("Louis", 30)

    # Two people owe two people
    activity_4 = Activity.new("Jet Skiing")
    activity_4.add_participant("Maria", 0)
    activity_4.add_participant("Luther", 0)
    activity_4.add_participant("Louis", 40)
    activity_4.add_participant("Nemo", 40)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    reunion.add_activity(activity_3)
    reunion.add_activity(activity_4)

    result = reunion.detailed_breakout
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
    assert_equal expected, result
  end
end
