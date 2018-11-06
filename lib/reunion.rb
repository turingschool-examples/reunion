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
    @activities.sum{|activity| activity.total_cost}
  end

  def breakout
    @activities.reduce({}) do |rslt, activity|
      rslt.merge(activity.owed) do |key, oldval, newval|
        oldval + newval
      end
    end
  end

  def summary
    breakout.reduce([]) do |rslt, (name, owed)|
      rslt << "#{name}: #{owed}"
    end.join("\n")
  end

  def detailed_breakout_of_participant(name)
    @activities.reduce([]) do |rslt, activity|
      next(rslt) unless activity.participants[name]
      payees = activity.participants.reject do |k, v|
        v == activity.participants[name]
      end.keys
      rslt << {
        activity: activity.name,
        payees: payees,
        amount: activity.owed[name] / payees.size
      }
    end
  end

    def detailed_breakout
      participants = breakout.keys
      participants.reduce({}) do |rslt, participant|
        rslt[participant] = detailed_breakout_of_participant(participant)
        rslt
      end
    end


  end
