require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'
require 'pry'

class ReunionTest < Minitest::Test

  def test_a_reunion_exist
    reunion = Reunion.new("1406 BE")
    assert_instance_of Reunion, reunion
  end

  def test_a_reunion_has_a_name
    reunion = Reunion.new("1406 BE")
    assert_equal "1406 BE", reunion.name
  end

  def test_a_reunion_has_no_activities_by_default
    reunion = Reunion.new("1406 BE")
    assert_equal [], reunion.activities
  end

  def test_a_reunion_can_add_activities
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    reunion.add_activity(activity_1)
    assert_equal [activity_1], reunion.activities
  end

  def test_a_reunion_can_calculate_total_cost
    reunion = Reunion.new("1406 BE")

    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    reunion.add_activity(activity_1)

    assert_equal 60, reunion.total_cost
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    reunion.add_activity(activity_2)

    assert_equal 180, reunion.total_cost
  end

  def test_a_reunion_can_calculate_breakout
    reunion = Reunion.new("1406 BE")

    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    expected = {
      "Maria" => -10, "Luther" => -30, "Louis" => 40
    }
    assert_equal expected, reunion.breakout
  end

  def test_a_reunion_can_assemble_a_summary_string
    reunion = Reunion.new("1406 BE")

    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)

    assert_equal "Maria: -10\nLuther: -30\nLouis: 40", reunion.summary
  end

  def test_a_reunion_can_print_its_summary
    reunion = Reunion.new("1406 BE")

    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)

    puts reunion.summary
  end

  def test_a_reunion_can_create_a_detailed_breakout
    reunion = Reunion.new("1406 BE")

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

    reunion.add_activity(activity_1)
    reunion.add_activity(activity_2)
    reunion.add_activity(activity_3)
    reunion.add_activity(activity_4)

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
    assert_equal ["Maria", "Luther", "Louis", "Nemo"], reunion.participant_names
    assert_equal expected, reunion.detailed_breakout
  end
end
