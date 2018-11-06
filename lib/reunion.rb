require "pry"

class Reunion
  attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.map do |activity|
      activity.total_cost
    end.sum
  end

  def breakout
    final_owed = Hash.new(0)
    owed = @activities.map do |activity|
      activity.owed.each do |person, money|
        final_owed[person] += money
      end
    end
    final_owed
  end

  def summary
    summaries = []
    breakout.each do |person, money|
      summaries <<  "#{person}: #{money}\n"
    end
    summaries.join.chomp
  end

  def detailed_breakout

  end

  def activities_by_person(person)
    @activities.find_all do |activity|
      activity.participants.include?(person)
    end
  end

  def find_payees(person, fun_time)
    activities_by_person(person).map do |activity|
      if activity == fun_time
        activity.participants.delete(person)
        activity.participants.keys
      end
    end.flatten.compact
  end

  def amount_owed_per_activity(person, fun_time)
    activities_by_person(person).map do |activity|
      if activity == fun_time
        activity.owed.delete(person)
      end
    end.compact
  end


end
