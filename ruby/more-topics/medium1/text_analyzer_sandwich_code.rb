class TextAnalyzer
  def process
    file = File.open("sample1.txt", 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process do |text|
  paragraphs = text.scan(/(([\w .])+\n?)+/).size
  puts "Paragraphs: #{paragraphs}"
end
analyzer.process do |text|
  sentences = text.scan(/((\w+\s?)+\.)/).size
  puts "Sentences: #{sentences}"
end
 # your implementation }
analyzer.process do |text|
  words = text.scan(/\w+/).size
  puts "words: #{words}"
end

analyzer.process do |text|
  lines = text.scan(/.+/).size
  puts "lines: #{lines}"
end