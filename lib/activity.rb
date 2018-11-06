class Activity
  attr_reader
  def initialize(name)
    @name = name
    @participants = Hash.new(0)
  end

end
