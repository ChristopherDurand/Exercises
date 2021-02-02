class Transform
  def initialize(str)
    @data = str
  end
  def uppercase
    @data.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end
