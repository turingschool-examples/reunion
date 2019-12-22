class Reunion
attr_reader :name,
            :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    all_activities_cost = @activities.sum do |activity|
      activity.total_cost
    end
    all_activities_cost
  end

  def breakout

    #return a hash with each participant as the key value is money owed
    #total money paid
    final_breakdown = Hash.new(0)
    @activities.each do |activity|
      activity.owed.each do |participant, cost|
        final_breakdown[participant] += cost
      end
    end
    final_breakdown
  end

    #return a hash, key is persons name, value is what they owe for the whole
    #reunion.
    # breakout = Hash.new(0)
    # @activities.map do |activity|
    #   activity.owed.reduce({}) do |breakout, participant|
    #     if breakout[participant[0]].nil?
    #       breakout[participant[0]] = activity.split - participant[1]
    #     else
    #       breakout[participant[0]] += activity.split - participant[1]
    #       breakout
    #     end
    #   end
    # end
end
