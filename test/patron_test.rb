require_relative 'test_helper'
require './lib/patron'
class PatronTest < Minitest::Test

  def test_it_exists
    patron = Patron.new("Bob")

    assert_instance_of Patron, patron
  end

  def test_patron_has_a_name
    patron = Patron.new("Bob")

    assert_equal "Bob", patron.name
  end
end
