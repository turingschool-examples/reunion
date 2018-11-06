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