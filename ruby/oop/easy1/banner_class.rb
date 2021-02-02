class Banner
  def initialize(m, fixed = false)
    @message = m
    if !fixed || fixed < 4
      @fixed = false
    else
      @fixed = true
      @width = fixed
    end
  end

  def to_s
    if @fixed
      fixed_banner
    else
      non_fixed_banner
    end
  end

  private
  def fixed_banner
    [horizontal_rule, 
      empty_line, 
      fixed_message_line, 
      empty_line, 
      horizontal_rule].flatten.join("\n")
  end

  def fixed_message_line
    #Count up from 1 until a divisor is found such that:
    #message size / divisor < width
    #Split the message into N equal size messages accordingly
    #Append spaces to the beginning and end of each line, until
    #the space is filled and desired width is achieved.
    lines = split_message(how_many_lines)
    lines.each do |line|
      loop do
        if line.length < @width
          line << " "
        else
          break
        end
      end
    end
    lines
  end

  def split_message(divisor)
    outcome = []
    divisor.times do |idx|
      start = (@message.length * (idx / divisor.to_f)).floor
      length = (@message.length / divisor.to_f).ceil
      outcome << @message[start,length]
    end
    outcome
  end
  def how_many_lines
    divisor = 1
    loop do 
      if @message.size / divisor < @width
        break divisor
      else
        divisor += 1
      end
    end
  end

  def non_fixed_banner
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end
  def horizontal_rule
    "+-" + "-" * @message.size + "-+"
  end

  def empty_line
    "| " + " " * @message.size + " |"
  end

  def message_line
    "| #{@message} |"
  end
end

thanks = Banner.new("Thank you for yourss hard work", 10)
banner = Banner.new("")
puts thanks
puts banner