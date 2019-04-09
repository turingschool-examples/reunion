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
    activities.sum{|activity| activity.total_cost}
  end

  def breakout
    test = {}
    @activities.each do |activity|
      test.merge!(activity.owed){|k, oldv, newv| oldv + newv}
    end
    test
  end

  def summary
    summary_string = ""
    breakout.each_pair do |k, v|
      summary_string += "#{k}: #{v}\n"
    end
    summary_string.chomp
  end

  def detailed_summary
    summaryhash = {}
    @activities.each do |activity|
      activity.owed.each_key do |k|
        summaryhash[k] = []
      end
    end
    @activities.each do |activity|
      activity.owed.each_pair do |k, v|
        others = activity.participants.keys.reject{|person| person == k}
        summaryhash[k] << {
          activity: activity.name,
          payees: [],
          amount: v
        }
        others.each do |person|
          if activity.owed[k] != activity.owed[person]
            summaryhash[k].last[:payees] << person
          end
        end
        summaryhash[k].last[:amount] = (summaryhash[k].last[:amount] / \
        summaryhash[k].last[:payees].count)
      end
    end
    summaryhash
  end

end
