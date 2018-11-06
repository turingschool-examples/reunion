
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
    hash = Hash.new(0)
    @activities.map do |activity|
      activity.owed.each do |key, value|
        hash[key] += value
      end
    end
    hash
  end

  def summary
    breakout.map do |person, owed|
      "#{person}: #{owed}\n"
    end.join.chomp
  end

  def detailed_breakout
    final_hash = Hash.new(0)

    @activities.each do |activity|
       activity.participants.keys.each do |person|
        final_hash[person] = 0
      end
    end

    final_hash

    #return should be a hash
    #each key is the name of attendee
    #value is an array that contains hashes of
    #activity: (String name of activity)
    #payees: names of other attendees
    #amount: total amount owed pos or neg
  end
end
