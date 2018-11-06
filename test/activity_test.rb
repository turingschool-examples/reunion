require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require 'pry'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new("Brunch")

    assert_intance_of Activity, activity
  end

  def test_it_has_name
    activity = Activity.new("Brunch")

    asser_equal "Brunch", activity.name
  end

  def test_it_can_store_parecipants
    activity = Activity.new("Brunch")

    expected = {}
    asser_equal expected, activity.participants
  end

  def test_it_can_add_partecipants
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)
    expected = {"Maria" => 20}, activity.participants
  end

  def test_it_can_calculate_total_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Maria", 20)

    asser_equal 20, activity.total_cost
  end
end
