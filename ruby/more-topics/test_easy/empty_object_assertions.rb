require 'minitest/autorun'

class MyTest < Minitest::Test
  def test_value
    value =3
    assert value.odd?, 'value is not odd'
  end
  
  # Write a minitest assertion that will fail if value.downcase does not return 'xyz'.
  def test_downcase
    value = 'XyZ'
    assert_equal('xyz', value.downcase)
  end
  
  #Write a minitest assertion that will fail if value is not nil.
  def test_nil
    value = nil
    assert_nil value
  end
  
  #Write a minitest assertion that will fail if the Array list is not empty.
  def test_empty
    list = []
    assert_empty list
  end

end