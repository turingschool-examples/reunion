require "minitest/autorun"
require "./lib/reunion"
require "./lib/activity"
class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1406 BE")
  end

  def setup_two_activities
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    @reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    @reunion.add_activity(activity_2)
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_it_has_a_name
    assert_equal "1406 BE", @reunion.name
  end

  def test_it_starts_with_an_activity_array
    assert_equal [], @reunion.activities
  end

  def test_you_can_add_an_activity
    activity_1 = Activity.new("brunch")
    @reunion.add_activity(activity_1)
    assert_equal [activity_1], @reunion.activities
  end

  def test_you_can_add_activities
    activity_1 = Activity.new("brunch")
    activity_2 = Activity.new("lunch")
    @reunion.add_activity(activity_1)
    @reunion.add_activity(activity_2)
    assert_equal [activity_1, activity_2], @reunion.activities
  end

  def test_total_cost_sums_all_costs_of_all_activities
    setup_two_activities
    assert_equal 180, @reunion.total_cost
  end

  def test_breakout_breaks_out_what_is_owed_by_each_participant
    setup_two_activities
    assert_equal ({"Maria" => -10, "Luther" => -30, "Louis" => 40}), @reunion.breakout
  end

  def test_summary_returns_breakout_as_a_string
    setup_two_activities
    assert_equal "Maria: -10\nLuther: -30\nLouis: 40", @reunion.summary
  end



# reunion = Reunion.new("1406 BE")
# => #<Reunion:0x007fe4ca1defc8 ...>

# activity_1 = Activity.new("Brunch")

# activity_1.add_participant("Maria", 20)

# activity_1.add_participant("Luther", 40)

# reunion.add_activity(activity_1)

# reunion.total_cost
# => 60

# activity_2 = Activity.new("Drinks")

# activity_2.add_participant("Maria", 60)

# activity_2.add_participant("Luther", 60)

# activity_2.add_participant("Louis", 0)

# reunion.add_activity(activity_2)

# reunion.total_cost
# => 180

# reunion.breakout
# => {"Maria" => -10, "Luther" => -30, "Louis" => 40}

# reunion.summary
# => "Maria: -10\nLuther: -30\nLouis: 40"

# puts reunion.summary

end
