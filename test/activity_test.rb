require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("Brunch")

    assert_instance_of Activity, activity
  end

  def test_it_has_name
    activity = Activity.new("Brunch")

    assert_equal "Brunch", activity.name
  end

  def test_it_can_store_parecipants
    activity = Activity.new("Brunch")

    expected = {}
    assert_equal expected, activity.participants
  end

  def test_it_can_add_partecipants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expected = {"Maria" => 20, "Luther" => 40}

    assert_equal expected , activity.participants
  end

  def test_it_can_calculate_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)

    assert_equal 20, activity.total_cost
  end
end
