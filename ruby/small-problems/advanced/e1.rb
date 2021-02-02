TAG = /<(.+?)>/
WHOLE_TAG = /\<.+?\>/
WORDS = {"adjective" => %w(quick lazy sleepy ugly),
         "noun"      => %w(fox dog head leg cat tail),
         "verb"      => %w(spins bites licks hurdles),
         "adverb"    => %w(easily lazily noisly excitedly)}

def get_needed(text)
  text.scan(TAG)
end

def prompt_user(needed)
  indices = 0.upto(needed.size-1).to_a.shuffle
  given = []
  indices.each do |idx|
    part = needed[idx]
    vowel = part[0] =~ /[aeiou]/i ? true : false
    print "Please give me a"
    print "n" if vowel
    spaces = " " * (10 - part.length - (vowel ? 1 : 0))
    print " #{part}:#{spaces}==> "
    given[idx] = gets.chomp
  end
  given
end

def random_fill(needed)
  needed.map { |need| WORDS[need].sample }
end


def replace_blanks!(text, given)
  text.gsub!(WHOLE_TAG) { given.shift }
end

text = open("madlib.txt").read
needed = get_needed(text).flatten #.shuffle
given = random_fill(needed)
replace_blanks!(text, given)
puts text
