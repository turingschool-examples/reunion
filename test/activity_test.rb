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

  def test_it_starts_with_an_empty_hash_for_participants
    activity = Activity.new("Brunch")

    assert_equal ({}), activity.participants
  end

  def test_participants_can_be_added
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)

    expected = {"Maria" => 20}
    assert_equal expected, activity.participants
  end

  def test_it_can_return_the_total_cost_paid_for_the_activity
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)


    assert_equal 20, activity.total_cost

    activity.add_participant("Luther", 40)
    
    assert_equal 60, activity.total_cost
  end

  def test_that_more_than_one_participant_can_be_added
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    expected = {"Maria" => 20, "Luther" => 40}
    assert_equal expected, activity.participants
  end

end



# activity = Activity.new("Brunch")
# # => #<Activity:0x007fe4ca1df568 ...>
#
# activity.name
# # => "Brunch"
#
# activity.participants
# # => {}
#
# activity.add_participant("Maria", 20)
#
# activity.participants
# # => {"Maria" => 20}
#
# activity.total_cost
# # => 20
#
# activity.add_participant("Luther", 40)
#
# activity.participants
# # => {"Maria" => 20, "Luther" => 40}
