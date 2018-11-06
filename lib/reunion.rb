class Reunion

  attr_reader :name,
              :activities

  def initialize(name)
    @name       = name
    @activities = []
  end

  def add_activity(activity_object)
    @activities << activity_object
  end

  def total_cost
    sum = 0
    @activities.each do |activity|
      activity.participants.each do |name, cost|
        sum += cost
      end
    end
    sum
  end

  def breakout
    total_money_owed = Hash.new(0)
    @activities.each do |activity|
      activity.participants.each do |name, cost|

        current_total = total_money_owed[name]
        total_for_activity = activity.split - cost

        total_money_owed[name] = current_total + total_for_activity
      end
    end
    total_money_owed
  end


  def summary
    full_string = ""
    loop_counter = 0
    breakout.each do |participant, amount_owed|
      loop_counter += 1

        if breakout.keys.count > loop_counter
          full_string += "#{participant}: #{amount_owed}\n"
        else
          full_string += "#{participant}: #{amount_owed}"
        end
    end
    full_string
  end

  def detailed_breakout
    outer_hash = Hash.new
    @activities.each do |specific_activity|
      specific_activity.participants.each do |name, cost|

        info_array = []
        name_array = []
        inner_hash = Hash.new
        inner_hash[:activity] = specific_activity.name

    #  binding.pry
        breakout.each do |new_name, amount_owed|
          if new_name != name
            name_array << new_name
            inner_hash[:payees] = name_array
          end
            inner_hash[:amount] = amount_owed
        end

        info_array << inner_hash
        outer_hash[name] = info_array

      end
    end
    outer_hash
  end
end
