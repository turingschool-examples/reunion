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
end
