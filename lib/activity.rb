
class Activity
  attr_reader :name

  def initialize(name)
    @name = name
    @participants = {}
  end

end
