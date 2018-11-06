require 'minitest/test'
require 'minitest/autorun'
require 'pry'
require_relative '../lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_exists
    skip
    assert_instance_of activity, Activity
  end

  def test_it_has_name
    assert_equal "Brunch", @activity.name
  end

  def test_it_has_participants
    skip
    assert_equal ({}), @activity.participants
  end

  def test_it_adds_participants
    @activity.add_participant("Maria", 20)
    assert_equal ({"Maria" => 20}), @activity.participants
  end

  #def test_it_returns_total_cost
  #  skip
  #  @activity.add_participant("Maria", 20)
  #  assert_equal 20, @activity.total_cost
  #end

  #def test_it_adds_multiple_participants
  #  skip
  #  @activity.add_participant("Maria", 20)
  #  @activity.add_participant("Luther", 40)
  #  assert_equal ({"Maria" => 20, "Luther" => 40}), @activity.participants
  #end

end
