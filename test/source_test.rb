require 'minitest/autorun'
require 'awesome_print'
require 'json'

class SourceTest < MiniTest::Unit::TestCase
  def test_something
    @sources = JSON.load(File.open("./test/fixtures/source_fixture.json"))
    assert @sources["sources"][0]["name"] == "Hacker News", "Name not found"
  end

end
