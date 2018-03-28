require 'pry'
class Museum
  attr_reader :name, :exhibits, :revenue
  def initialize(name)
    @name = name
    @exhibits = {}
    @revenue = 0
  end

  def add_exhibit(name, cost)
    @exhibits[name] = cost
  end

  def admit(patron)
    @revenue += 10
    matches = @exhibits.each_key do |key|
      key == patron.interests
    end
    matches.each_value do |match|
      @revenue += match
    end
  end
    #check to see if an exhibit matches a patron's interest
    #if there is a match, add exhibit cost to revenue
    #
    #

end
