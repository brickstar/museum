require 'pry'
class Museum
  attr_reader :name, :exhibits, :revenue
  def initialize(name)
    @name = name
    @exhibits = Hash.new(0)
    @revenue = 0
    @patrons = []
  end

  def add_exhibit(name, cost)
    @exhibits[name] = cost
  end

  def admit(patron)
    @revenue += 10
    matches = @exhibits.each_key do |key|
      key == patron.interests
      # @exhibits[patronpatron.name
    end
    matches.each_value do |match|
      # binding.pry
      @revenue += match
    end
  end

  def patrons_of(exhibit)

  end
  #a patron is admitted
  #if they have interest in an exhibit
  #revenue increases the amount of the exhibit cost
  #
  #exhibit
end
