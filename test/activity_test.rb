require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @activity = Activity.new("Brunch")
  end

  def test_it_exists
    assert_instance_of Activity, @activity
  end

  def test_it_initializes
    assert_equal "Brunch", @activity.name
    empty_hash = {}
    assert_equal empty_hash, @activity.participants
  end

  def test_it_can_add_participants
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    expected_hash = {"Maria" => 20, "Luther" => 40}
    assert_equal expected_hash, @activity.participants
  end

  def test_it_can_get_total_cost_of_participants
    @activity.add_participant("Maria", 20)
    assert_equal 20, @activity.total_cost
    @activity.add_participant("Luther", 40)
    assert_equal 60, @activity.total_cost
  end

  def test_it_can_split_total_cost_between_participants
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    assert_equal 30, @activity.split
  end

  def test_it_can_calculate_amount_still_owed_by_participants_after_split
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    expected_hash = {"Maria" => 10, "Luther" => -10}
    assert_equal expected_hash, @activity.owed
  end

  def test_it_can_identify_payees_per_activity_per_person
    @activity.add_participant("Maria", 20)
    @activity.add_participant("Luther", 40)
    assert_equal ["Luther"], @activity.payees_for("Maria")
    @activity.add_participant("Bob", 0)
    @activity.add_participant("George", 0)
    assert_equal ["Bob", "George"], @activity.payees_for("Maria")
  end

  def test_it_can_calculate_amount_owed_per_payee_to_given_participant
    @activity.add_participant("Maria", 40)
    @activity.add_participant("Luther", 80)
    @activity.add_participant("Bob", 0)
    @activity.add_participant("George", 0)
    assert_equal -5, @activity.amount_owed_per_payee("Maria")
    assert_equal -25, @activity.amount_owed_per_payee("Luther")
    assert_equal 15, @activity.amount_owed_per_payee("Bob")
    assert_equal 15, @activity.amount_owed_per_payee("George")
  end
end
