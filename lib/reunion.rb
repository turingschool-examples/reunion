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
    t = 0
    @activities.each do |activity|
      t += activity.total_cost
    end
    t
  end

  def all_participants
    parties = []
    @activities.each do |activity|
      activity.participants.each_key do |key|
        parties << key
      end
    end
    parties.uniq
  end

  def breakout_by_participant(participant)
    total = 0
    @activities.each do |activity|
      if activity.owed[participant] != nil
        total += activity.owed[participant]
      end
    end
    total
  end

  def breakout
    breakout_hash = {}
    all_participants.each do |party|
      breakout_hash[party] = breakout_by_participant(party)
    end
    breakout_hash
  end

  def summary
    result = ''
    breakout.each do |party, value|
      result += "#{party}: #{value}\n"
    end
    result
  end

  def payees_and_total(activity, person)
    #sorry, didn't have time to break this into smaller methods!
    payees = []
    info = activity.owed
    total = info[person]
    positive_total = true if total > 0
    info.delete(person)
    info.each do |party, value|
      if positive_total && info[party] < 0
        payees << party
      elsif positive_total == false && info[party] > 0
        payees << party
      end
    end
    {activity: activity, payees: payees, total: total}
  end

  def detailed_breakout
    #for each person
    #  for each of that persons activities
    #    find that persons payees and total
    #  end
    #end
  end

end
