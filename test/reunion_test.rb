require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest:: Test

  def test_it_exists
    reunion = Reunion.new("1406 BE")
    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_name
    reunion = Reunion.new("1406 BE")
    assert_equal "1406 BE", reunion.name
  end

  def test_it_has_empty_activities_array
    reunion = Reunion.new("1406 BE")
    assert_equal [], reunion.activities
  end

  def test_it_can_add_an_activity
    reunion    = Reunion.new("1406 BE")
    activity_1 = Activity.new("Brunch")
    reunion.add_activity(activity_1)

    expected = activity_1
    actual   = reunion.activities
    assert_equal expected, actual
  end


end
