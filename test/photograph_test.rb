require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'

class PhotographTest < Minitest::Test
  def setup
    @attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }

    @attributes_with_strings = {
      "id"=> "1",
      "name"=> "Rue Mouffetard, Paris (Boy with Bottles)",
      "artist_id"=> "4",
      "year"=> "1954"
    }
    @photograph_1 = Photograph.new(@attributes)
    @photograph_2 = Photograph.new(@attributes_with_strings)
  end

  def test_it_exists
    assert_instance_of Photograph, @photograph_1
    assert_instance_of Photograph, @photograph_2
  end

  def test_initialize
    assert_equal @attributes[:id], @photograph_1.id
    assert_equal @attributes[:name], @photograph_1.name
    assert_equal @attributes[:artist_id], @photograph_1.artist_id
    assert_equal @attributes[:year], @photograph_1.year

    assert_equal @attributes_with_strings["id"], @photograph_2.id
    assert_equal @attributes_with_strings["name"], @photograph_2.name
    assert_equal @attributes_with_strings["artist_id"], @photograph_2.artist_id
    assert_equal @attributes_with_strings["year"], @photograph_2.year
  end
end
