
BLOCKS = [%w(B O), %w(G T), %w(V I), %w(X K),
          %w(R E), %w(L Y), %w(D Q), %w(F S),
 %w(Z M), %w(C P), %w(J W), %w(N A), %w(H U)]
def block_word?(word)
  used_blocks = []
  word.upcase.chars.each do |char|
    BLOCKS.each do |block|
      if block.include?(char)
        return false if used_blocks.include?(block)
        used_blocks << block
      end
    end
  end
  true
end

puts block_word?('BATCH') == true
puts block_word?('BUTCH') == false
puts block_word?('jest') == true
