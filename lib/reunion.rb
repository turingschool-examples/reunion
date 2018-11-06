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
    @activities.sum do |activity|
      activity.total_cost
    end
  end

  def breakout
    final_output = {}
    @activities.each do |activity|
      activity.owed.each do |name, money_spent|
        it_exists = final_output.include?(name)
        it_exists ? final_output[name] += money_spent : final_output[name] = money_spent
      end
    end
    final_output
  end

  def summary
    summary_output = ""
    breakout.each do |name, balance|
      summary_output << "#{name}: #{balance}\n"
    end
    summary_output.chomp
  end

end
