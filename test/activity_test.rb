require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new("Brunch")
    assert_equal "Brunch", activity.name
  end

  def test_it_has_empty_hash_of_participants_by_default
    activity = Activity.new("Brunch")
    expected = {}
    assert_equal expected, activity.participants
  end

  def test_it_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    expected = {"Maria" => 20}
    assert_equal expected, activity.participants
    activity.add_participant("Luther", 40)
    expected = {"Maria" => 20, "Luther" => 40}
    assert_equal expected, activity.participants
  end

  def test_it_can_find_the_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal 60, activity.total_cost
  end

  def test_it_can_find_the_split_amount
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal 30, activity.split
  end

  def test_it_can_find_who_owes_what
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expected = {"Maria" => 10, "Luther" => -10}
    assert_equal expected, activity.owed
  end

  def test_it_can_tell_who_owed_who_for_1_person
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    expected = {
      "Maria" => {activity: "Brunch", payees: ["Luther"],
                  amount: 10},
      "Luther" => {activity: "Brunch", payees: ["Maria"],
                  amount: -10}
    }
    assert_equal expected, activity_1.owed_to
  end

  def test_it_can_tell_who_owed_who_for_1_owes_2_people
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)

    expected = {
      "Maria" => {activity: "Drinks", payees: ["Louis"],
                  amount: -20},
      "Luther" => {activity: "Drinks", payees: ["Louis"],
                  amount: -20},
      "Louis" => {activity: "Drinks", payees: ["Maria", "Luther"],
                  amount: 20}
    }
    assert_equal expected, activity_2.owed_to
  end


  def test_it_can_tell_who_owed_who_for_2_owes_1
    activity_3 = Activity.new("Bowling")
    activity_3.add_participant("Maria", 0)
    activity_3.add_participant("Luther", 0)
    activity_3.add_participant("Louis", 30)

    expected = {
      "Maria" => {activity: "Bowling", payees: ["Louis"],
                  amount: 10},
      "Luther" => {activity: "Bowling", payees: ["Louis"],
                  amount: 10},
      "Louis" => {activity: "Bowling", payees: ["Maria", "Luther"],
                  amount: -10}
    }
    assert_equal expected, activity_3.owed_to
  end

  def test_it_can_tell_who_owed_who_2_owe_2
    activity_4 = Activity.new("Jet Skiing")
    activity_4.add_participant("Maria", 0)
    activity_4.add_participant("Luther", 0)
    activity_4.add_participant("Louis", 40)
    activity_4.add_participant("Nemo", 40)

    expected = {
      "Maria" => {activity: "Jet Skiing", payees: ["Louis", "Nemo"],
                  amount: 10},
      "Luther" => {activity: "Jet Skiing", payees: ["Louis", "Nemo"],
                  amount: 10},
      "Louis" => {activity: "Jet Skiing", payees: ["Maria", "Luther"],
                  amount: -10},
      "Nemo" => {activity: "Jet Skiing", payees: ["Maria", "Luther"],
                  amount: -10}
    }
    assert_equal expected, activity_4.owed_to
  end
end
