require 'minitest/test'
require 'minitest/autorun'
require 'pry'
require_relative '../lib/activity'
require_relative '../lib/reunion'

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_name_and_activities
    assert_equal "1406 BE", @reunion.name
    assert_equal [], @reunion.activities
  end

  def test_it_adds_activities
    @reunion.add_activity(@activity_1)
    assert_equal [@activity_1], @reunion.activities
  end

  def test_it_calculates_total_cost
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

  def test_it_finds_all_participants
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)
    assert_equal ["Maria", "Luther", "Louis"], reunion.all_participants
  end

  def test_it_calculates_breakout_for_one_participant
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)
    assert_equal (-10), reunion.breakout_by_participant("Maria")
    assert_equal (-30), reunion.breakout_by_participant("Luther")
    assert_equal (40), reunion.breakout_by_participant("Louis")
  end

  def test_it_calculates_breakout_for_all_participants
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)
    expected = {"Maria" => -10, "Luther" => -30, "Louis" => 40}
    assert_equal (expected), reunion.breakout
  end

  def test_it_returns_summary
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)
    expected = "Maria: -10\nLuther: -30\nLouis: 40\n"
    assert_equal expected, reunion.summary
  end

  def test_it_returns_payees_and_total
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
    expected = {activity: "Brunch", payees: ["Luther"], amount: 10}
    actual = reunion.payees_and_total(activity_1, "Maria")
  end

end
