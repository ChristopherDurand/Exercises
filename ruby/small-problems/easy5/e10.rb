TERMINAL_WIDTH = 80
PADDING = 2
YES = %w(1 2 3 4 5 6 7 8 9 0 a b c d e f g h i j k l m n o p q r s t u v w x y z)
def print_line(length)
  str = "+"
  length.times { str << "-" }
  str << "+"
  puts str
end

def print_blank_line(length)
  str = "|"
  length.times { str << " " }
  str << "|"
  puts str
end

def number_of_lines(string)
  (string.length.to_f / (TERMINAL_WIDTH - 2 * PADDING)).ceil
end

def how_wide(string)
  (string.length.to_f / number_of_lines(string)).ceil
end

def format_lines!(lines, target_width)
  lines.map! do |line|
    spaces = target_width - line.length
    beginning_spaces = (spaces.to_f / 2).floor
    end_spaces = (spaces.to_f / 2).ceil
    "| " + " " * beginning_spaces + line +  " "* end_spaces + " |"
  end
end

def break_into_lines(string, target_width)
  lines = []
  (0...number_of_lines(string)).each do |n|
    lines << string[n*target_width, target_width]
  end
  lines
end

def multi_line_print(string, target_width)
  lines = break_into_lines(string, target_width)
  format_lines!(lines, target_width)
  lines.each { |line| puts line }

end

def print_in_box(string)
  banner_width = how_wide(string)
  print_line(banner_width + PADDING)
  print_blank_line(banner_width + PADDING)
  multi_line_print(string, banner_width)
  print_blank_line(banner_width + PADDING)
  print_line(banner_width + PADDING)
end

printee = ""

(0...233).each do |n|
  printee << YES[n % YES.length]
end

print_in_box(printee)
