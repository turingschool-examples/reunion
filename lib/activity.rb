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
      unless find_people_who_owe(person).length == 0
        owed_amount = owed[person] / find_people_who_owe(person).length
      else
        owed_amount = 0
      end
      detailed_breakout[person] = {activity: @name,
          payees: find_people_who_owe(person), amount: owed_amount}
    end
    detailed_breakout
  end

  def find_people_who_owe(person)
    if owed[person] < 0
      people =  participants.find_all do |other_person, paid|
        owed[other_person] > 0
      end
    elsif owed[person] > 0
      people =  participants.find_all do |other_person, paid|
        owed[other_person] < 0
      end
    else
      return []
    end
    people.map { |name, amount| name }
  end
end
