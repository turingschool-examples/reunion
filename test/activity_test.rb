require './lib/activity'
require 'minitest/autorun'
require 'minitest/emoji'
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

  def test_it_starts_with_no_participants
    activity = Activity.new("Brunch")

    assert_equal ({}), activity.participants
  end

  def test_it_can_add_a_participant
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), activity.participants
  end

  def test_it_can_add_start_with_zero_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    assert_equal 20, activity.total_cost
  end





end



# pry(main)> activity.total_cost
# # => 20
#
# pry(main)> activity.add_participant("Luther", 40)
#
# pry(main)> activity.participants
# # => {"Maria" => 20, "Luther" => 40}
