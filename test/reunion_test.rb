require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
  end

  def test_it_has_a_name
    assert_equal "1406 BE", @reunion.name
  end

  def test_it_has_no_activities_to_start
    assert_equal [], @reunion.activities
  end

  def test_it_can_add_activities
    assert_equal [], @reunion.activities

    @reunion.add_activity(@activity_1)

    assert_equal [@activity_1], @reunion.activities
  end
end
