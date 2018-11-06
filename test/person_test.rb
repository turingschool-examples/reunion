require 'minitest/autorun'
require 'minitest/pride'
require './lib/person'

class PersonTest < Minitest::Test
  def test_it_exists
    person = Person.new("Alice")
    assert_instance_of Person, person
  end

  def test_it_has_a_name
    person = Person.new("Alice")
    assert_equal "Alice", person.name
  end
end
