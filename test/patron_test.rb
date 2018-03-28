require_relative 'test_helper'
require './lib/patron'
class PatronTest < Minitest::Test

  def test_it_exists
    bob = Patron.new("Bob")

    assert_instance_of Patron, bob
  end

  def test_patron_has_a_name
    bob = Patron.new("Bob")

    assert_equal "Bob", bob.name
  end

  def test_its_interests_start_empty
    bob = Patron.new("Bob")

    assert_equal [], bob.interests
  end

  def test_it_can_add_interests
    bob = Patron.new("Bob")

    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")


    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end
end
