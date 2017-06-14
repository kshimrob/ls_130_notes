class TextAnalyzer
  def initialize
    @file = File.read('test.txt')
  end

  def process
    yield(@file) if block_given?
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs"}
analyzer.process { |text| puts "#{text.split(".").size} sentences" }
analyzer.process { |text| puts "#{text.split.size} words" }