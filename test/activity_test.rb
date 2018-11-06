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

  def test_it_can_count_the_total_participants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal 2, activity.total_participants
  end

  def test_that_the_total_cost_can_be_split
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    assert_equal 60, activity.total_cost
    assert_equal 30, activity.split
  end

  def test_it_can_calculate_the_amount_owed_by_each_participant_and_return_a_hash
    skip
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)

    expected = {"Maria" => 10, "Luther" => -10}

    assert_equal expected.owed
  end

end

# activity = Activity.new("Brunch")
# # => #<Activity:0x007fe4ca1df568 ...>
#
# activity.add_participant("Maria", 20)
#
# activity.add_participant("Luther", 40)
#
# activity.total_cost
# # => 60
#
# activity.split
# # => 30
#
# activity.owed
# # => {"Maria" => 10, "Luther" => -10}
# ```
#
