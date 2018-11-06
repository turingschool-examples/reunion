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
    @activities.reduce(Hash.new(0)) do |rslt, activity|
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


end
