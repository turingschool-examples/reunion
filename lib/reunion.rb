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
  #   @activities.map do |person|
  #       person.total_cost
  #   end.flatten.sum
  # end
  #
  # def breakout
  #   array_owed = @activities.map do |activity|
  #     activity.owed
  #   end
  #   array_owed[0].values.inject { |sum, n| sum + n }
  debt_amt = {}
    @activities.map.with_index do |activity, i|
      binding.pry
      debt_amt[person] = person.owed
    end
    debt_amt
  end
end
