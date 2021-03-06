require 'pry'
class Museum
  attr_reader :name, :exhibits, :revenue
  def initialize(name)
    @name = name
    @exhibits = Hash.new(0)
    @revenue = 0
    @patrons = Hash.new{|h, k| h[k] = []}
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
    matches.each_key do |key|
      @patrons[key] << patron.name
    end
  end

#museum has list of patron names paired with exhibits they have attended
#
  def patrons_of(exhibit)
    @patrons[exhibit]
  end

  def exhibits_by_attendees
    @patrons.values.sort_by do |value|
      value.length
    end
  end

end
