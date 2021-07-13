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
end

class EncryptedSecret
  def initialize ciphertext
    @ciphertext = ciphertext
  end
end

