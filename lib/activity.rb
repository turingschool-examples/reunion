require './lib/person'

class Activity
  attr_reader :name, :participants

  def initialize(name)
    @name = name
    @people_paid = {}
  end

  def add_participant(name, paid)
    person = Person.new(name)
    @people_paid[person] = paid
  end

  def participants
    @people_paid.map { |person, paid| [person.name, paid] }.to_h
  end

  def total_cost
    participants.sum { |person, paid| paid }
  end

  def split
    total_cost / participants.length
  end

  def owed
    participants.map { |person, paid| [person, split - paid] }.to_h
  end

end
