class Secret
  def initialize plaintext
    @plaintext = plaintext
    @charset = {}

    File.open('lib/character_set1.txt', 'r') do |f|
      f.readlines.map(&:chomp).each { |str| @charset[str[0]] = str[str.rindex(",") + 2..-1] }
    end
  end

  def encrypt int
    @plaintext.chars.map do |char| 
      "#{ (@charset[char].to_i + int) % 99 }"
      .sub(/^[0-9]{1}$/) { |num| "0#{num}" }
    end.join
  end

  def self.charset
    @charset
  end
end

class EncryptedSecret
  def initialize ciphertext
    @ciphertext = ciphertext
    @charset = {}

    File.open('lib/character_set1.txt', 'r') do |f|
      f.readlines.map(&:chomp).each { |str| @charset[str[0]] = str[str.rindex(",") + 2..-1] }
    end
  end

  def decrypt int
    plaintext = ""

    @ciphertext.chars.each_slice(2).map(&:join).each do |char|
      char = char[1..-1] if char[0] == "0"
      char = @charset.invert[(( char.to_i - int ) % 99 ).to_s ]
      plaintext << char
    end

    plaintext
  end
end
