require 'test_helper'
require './lib/museum'

class MuseumTest < Minitest::Test
  def test_it_exists
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_instance_of Museum, dmns
  end

  def test_it_has_a_name
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_it_starts_with_no_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")

    expected = {}
    assert_equal expected, dmns.exhibits
  end

  def test_it_can_add_exhibits
    dmns = Museum.new("Denver Museum of Nature and Science")

    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    expected = {"Dead Sea Scrolls" => 10, "Gems and Minerals" => 0}

    assert_equal expected, dmns.exhibits
  end

  def test_it_has_revenue_and_it_starts_at_zero
    dmns = Museum.new("Denver Museum of Nature and Science")

    assert_equal 0, dmns.revenue
  end

  def test_it_can_admit_patrons
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")

    sally = Patron.new("Sally")
    sally.add_interest("Dead Sea Scrolls")

    dmns.revenue

    dmns.admit(bob)
    dmns.admit(sally)

    assert_equal 40, dmns.revenue
  end

  def test_exhibits_can_return_names_of_patrons
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")

    sally = Patron.new("Sally")
    sally.add_interest("Dead Sea Scrolls")
    sally.add_interest("Gems and Minerals")

    dmns.admit(bob)
    dmns.admit(sally)

    assert_equal ["Bob", "Sally"], dmns.patrons_of("Gems and Minerals")
  end

  def test_exhibits_by_attendee
    dmns = Museum.new("Denver Museum of Nature and Science")
    dmns.add_exhibit("Dead Sea Scrolls", 10)
    dmns.add_exhibit("Gems and Minerals", 0)

    bob = Patron.new("Bob")
    bob.add_interest("Gems and Minerals")
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Imax")

    sally = Patron.new("Sally")
    sally.add_interest("Dead Sea Scrolls")
    sally.add_interest("Gems and Minerals")

    bryan = Patron.new("Brian")
    bryan.add_interest("Gems and Minerals")


    dmns.admit(bob)
    dmns.admit(sally)
    dmns.admit(bryan)

    assert_equal [["Bob", "Sally", "Brian"], ["Bob", "Sally", "Brian"]], dmns.exhibits_by_attendees
  end
end
