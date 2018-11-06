require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require 'pry'

class ReunionTest < Minitest::Test

  def test_a_reunion_exist
    reunion = Reunion.new("1406 BE")
    assert_instance_of Reunion, reunion
  end

  def test_a_reunion_has_a_name
    reunion = Reunion.new("1406 BE")
    assert_equal "1406 BE", reunion.name
  end

  def test_a_reunion_has_no_activities_by_default
    reunion = Reunion.new("1406 BE")
    assert_equal [], reunion.activities
  end
end
