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
    matches = @exhibits.keys.map do |name|
      patron.interests.find_all do |interest|
        name == interest
      end
    end.flatten
    matches.each do |match|
      @revenue += 
  end
    binding.pry
    #check to see if an exhibit matches a patron's interest
    #if there is a match, add exhibit cost to revenue
    #
    #

    end
  end
end
