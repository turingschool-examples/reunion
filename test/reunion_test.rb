require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end
end
