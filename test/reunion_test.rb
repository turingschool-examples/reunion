require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def test_it_exists
    reunion = Reunion.new("1406 BE")

    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_name
    reunion = Reunion.new("1406 BE")

    assert_equal "1406 BE", reunion.name
  end

  def test_it_starts_with_an_empty_array_for_activities
    reunion = Reunion.new("1406 BE")

    assert_equal [], reunion.activities
  end

  def test_activity_objects_can_be_added
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")

    reunion.add_activity(activity_1)
    assert_equal [activity_1], reunion.activities
  end

  def test_it_can_return_the_total_cost_for_the_whole_reunion_with_just_one_activity
    reunion = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)

    assert_equal 60, reunion.total_cost
  end

  def test_it_can_return_the_total_cost_for_the_whole_reunion_with_more_than_one_activity
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

    assert_equal 180, reunion.total_cost
  end

  def test_it_can_return_a_breakout_hash_of_what_each_person_owes_for_the_whole_reunion
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
    assert_equal expected, reunion.breakout
  end

  def test_it_can_produce_string_sumary_of_the_breakout_properly_formated
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

    expected = "Maria: -10\nLuther: -30\nLouis: 40"
    assert_equal expected, reunion.summary

  end

end



# # breakout` method, the key is a person's name and the value is what they owe for the whole reunion
#
#  reunion = Reunion.new("1406 BE")
# #
#  activity_1 = Activity.new("Brunch")
#
#  activity_1.add_participant("Maria", 20)
#
#  activity_1.add_participant("Luther", 40)
#
#  reunion.add_activity(activity_1)
#
#  reunion.total_cost
# # => 60
#
#  activity_2 = Activity.new("Drinks")
#
#  activity_2.add_participant("Maria", 60)
#
#  activity_2.add_participant("Luther", 60)
#
#  activity_2.add_participant("Louis", 0)
#
#  reunion.add_activity(activity_2)
#
#  reunion.total_cost
# # => 180
#
#  reunion.breakout
# # => {"Maria" => -10, "Luther" => -30, "Louis" => 40}
#
#  reunion.summary
# # => "Maria: -10\nLuther: -30\nLouis: 40"
#
#  puts reunion.summary
# Maria: -10
# Luther: -30
# Louis: 40
# ```
#
