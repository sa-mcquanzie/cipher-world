class Secret
  def initialize str
    @str = str
    @charset = {}

    File.open('lib/character_set1.txt', 'r') do |f|
      f.readlines.map(&:chomp).each { |str| @charset[str[0]] = str[str.rindex(",") + 2..-1]}
    end
  end

  def encrypt int
    @str.chars.map { |char| (@charset[char].to_i + int) % 99 }.join
  end
end