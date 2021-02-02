require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_value
    value =3
    assert value.odd?, 'value is not odd'
  end
end