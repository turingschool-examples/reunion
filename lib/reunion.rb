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
    @activities.inject(0) {|total_cost, activity| total_cost + activity.total_cost}
  end

  def breakout
    @activities.each_with_index.inject({}) do |total, (activity, index)|
      next_act = @activities[index + 1]
      if next_act
        total = activity.owed.merge(next_act.owed) {|key, val1, val2| val1 + val2}
      end
      total
    end
  end

  def summary
    breakout.inject("") do
      |output, (person, cost)| output + "#{person}: #{cost}\n"
    end.chomp
  end

  def detailed_breakout
    total_participants = participants
    total_participants.inject({}) do |breakout, name|
      breakout[name] = list_detailed_info(name)
    end
  end

  def participants
    participants = @activities.inject([]) do |total_participants, activity|
      total_participants << activity.participants.keys
    end
    participants.flatten.uniq
  end
end
