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
    total_cost / total_people
  end

  def total_people
    participants.length
  end

  def owed
    participants.map { |person, paid| [person, split - paid] }.to_h
  end

  def owed_to
    detailed_breakout = {}
    participants.each do |person, paid|
      detailed_breakout[person] = {
                                  activity: @name,
                                  payees: find_people_who_owe(person),
                                  amount: owed_amount(person)
                                  }
    end
    detailed_breakout
  end

  def owed_amount(person)
    unless find_people_who_owe(person).length == 0
      return owed[person] / find_people_who_owe(person).length
    else
      return 0
    end
  end

  def find_people_who_owe(person)
    if person_is_owed?(person)
      people =  participants.find_all do |other_person, paid|
        person_owes?(other_person)
      end
    elsif person_owes?(person)
      people = participants.find_all do |other_person, paid|
        person_is_owed?(other_person)
      end
    else
      return []
    end
    people.map { |name, amount| name }
  end

  def person_is_owed?(person)
    owed[person] < 0
  end

  def person_owes?(person)
    owed[person] > 0
  end
end
