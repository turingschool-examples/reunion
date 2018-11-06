class Reunion

attr_reader :name, :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity_name)
    @activities << activity_name
  end
  
end
