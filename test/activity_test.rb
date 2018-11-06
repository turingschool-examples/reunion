require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end
  
  def test_it_has_a_name
    activity = Activity.new("Brunch")
    assert_equal "Brunch", activity.name
  end
  
  def test_it_starts_with_no_participants
    activity = Activity.new("Brunch")
    assert_equal ({}), activity.participants
  end
  
  def test_it_can_add_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), activity.participants
    activity.add_participant("Luther", 40)
    assert_equal ({"Maria" => 20, "Luther" => 40}), activity.participants
  end
  
  def test_it_can_calculate_total_cost_of_activity
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal 20, activity.total_cost
    activity.add_participant("Luther", 40)
    assert_equal 60, activity.total_cost    
  end
  
  def test_it_can_split_total_cost_evenly
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal 30, activity.split
  end
  
  def test_it_can_calculate_what_participants_owe
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    assert_equal ({"Maria" => 10, "Luther" => -10}), activity.owed
  end
  
  def test_it_can_calculate_payees_breakout
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    expected = ({"Maria" => {activity: "Brunch", payees: ["Luther"], amount: 10}, "Luther" => {activity: "Brunch", payees: ["Maria"], amount: -10}})
    assert_equal expected, activity_1.payees_breakout
    
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    expected = ({"Maria" => {activity: "Drinks", payees: ["Louis"], amount: -20}, "Luther" => {activity: "Drinks", payees: ["Louis"], amount: -20}, "Louis" => {activity: "Drinks", payees: ["Maria", "Luther"], amount: 20}})
    assert_equal expected, activity_2.payees_breakout
  end
  
  def test_it_can_find_list_of_payees
    activity = Activity.new("Drinks")
    activity.add_participant("Maria", 60)
    activity.add_participant("Luther", 60)
    activity.add_participant("Louis", 0)
    assert_equal ["Louis"], activity.payees("Maria")
    assert_equal ["Louis"], activity.payees("Luther")
    assert_equal ["Maria", "Luther"], activity.payees("Louis")
  end
  
end

# pry(main)> activity = Activity.new("Brunch")
# # => #<Activity:0x007fe4ca1df568 ...>
# 
# pry(main)> activity.add_participant("Maria", 20)
# 
# pry(main)> activity.add_participant("Luther", 40)
# 
# pry(main)> activity.total_cost
# # => 60
# 
# pry(main)> activity.split
# # => 30
# 
# pry(main)> activity.owed
# # => {"Maria" => 10, "Luther" => -10}