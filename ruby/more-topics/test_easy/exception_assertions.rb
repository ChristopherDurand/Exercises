#Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
require 'minitest/autorun'
class NoExperienceError < StandardError; end
class Employee
  def initialize(name, experience)
    @name = name
    @experience = experience
  end
  def hire
    if @experience == 0
      raise NoExperienceError, "No experience"
    end
  end
end
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

  #Write a minitest assertion that will fail if the 'xyz' is not in the Array list.
  def test_include
    list = []
    list << 'xyz'
    assert_includes list, 'xyz'
  end

  #Write a minitest assertion that will fail unless employee.hire raises a NoExperienceError exception.
  def test_no_exp_error
    bob = Employee.new("bob",0)
    assert_raises(NoExperienceError) { bob.hire }
  end

end