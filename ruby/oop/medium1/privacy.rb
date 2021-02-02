class Machine

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def state
    case switch
      when :on then   "the switch is on."
      when :off then  "the switch is off."
    end
  end

  private

  attr_accessor :switch
  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

R2D2 = Machine.new
R2D2.start
puts R2D2.state

