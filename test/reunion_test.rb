require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1406 BE")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_a_name
    assert_equal "1406 BE", @reunion.name
  end

  def test_it_starts_with_no_activities
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activities
    activity_1 = Activity.new("Brunch")
    @reunion.add_activity(activity_1)

    assert_equal 1, @reunion.activities.count
    assert_equal activity_1, @reunion.activities.last
  end

  def test_it_can_give_total_cost_of_all_activities
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    @reunion.add_activity(activity_1)

    assert_equal 60, @reunion.total_cost

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    @reunion.add_activity(activity_2)

    assert_equal 180, @reunion.total_cost
  end

  def test_it_can_breakout_total_owed
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    @reunion.add_activity(activity_1)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    @reunion.add_activity(activity_2)

    expected = {"Maria" => -10, "Luther" => -30, "Louis" => 40}
    assert_equal expected, @reunion.breakout
  end

  def test_it_can_format_a_summary
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    @reunion.add_activity(activity_1)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    @reunion.add_activity(activity_2)

    expected = "Maria: -10\nLuther: -30\nLouis: 40"
    assert_equal expected, @reunion.summary
  end

  def test_it_gives_detailed_breakout
    skip
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    activity_3 = Activity.new("Bowling")
    activity_3.add_participant("Maria", 0)
    activity_3.add_participant("Luther", 0)
    activity_3.add_participant("Louis", 30)

    activity_4 = Activity.new("Jet Skiing")
    activity_4.add_participant("Maria", 0)
    activity_4.add_participant("Luther", 0)
    activity_4.add_participant("Louis", 40)
    activity_4.add_participant("Nemo", 40)

    @reunion.add_activity(activity_1)
    @reunion.add_activity(activity_2)
    @reunion.add_activity(activity_3)
    @reunion.add_activity(activity_4)

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
    require "pry"; binding.pry
    assert_equal expected, @reunion.detailed_breakout
  end

  def test_it_can_return_a_list_of_participants
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    activity_3 = Activity.new("Bowling")
    activity_3.add_participant("Maria", 0)
    activity_3.add_participant("Luther", 0)
    activity_3.add_participant("Louis", 30)

    activity_4 = Activity.new("Jet Skiing")
    activity_4.add_participant("Maria", 0)
    activity_4.add_participant("Luther", 0)
    activity_4.add_participant("Louis", 40)
    activity_4.add_participant("Nemo", 40)

    @reunion.add_activity(activity_1)
    @reunion.add_activity(activity_2)
    @reunion.add_activity(activity_3)
    @reunion.add_activity(activity_4)

    assert_equal ["Maria", "Luther", "Louis", "Nemo"], @reunion.participants
  end

  def test_it_can_list_detailed_info
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    activity_3 = Activity.new("Bowling")
    activity_3.add_participant("Maria", 0)
    activity_3.add_participant("Luther", 0)
    activity_3.add_participant("Louis", 30)

    activity_4 = Activity.new("Jet Skiing")
    activity_4.add_participant("Maria", 0)
    activity_4.add_participant("Luther", 0)
    activity_4.add_participant("Louis", 40)
    activity_4.add_participant("Nemo", 40)

    @reunion.add_activity(activity_1)
    @reunion.add_activity(activity_2)
    @reunion.add_activity(activity_3)
    @reunion.add_activity(activity_4)

    expected = [
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

    assert_equal expected, @reunion.list_detailed_info("Maria")
  end
end
