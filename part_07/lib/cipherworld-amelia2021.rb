module Cipher
  class LetterNumber
    def initialize(args)
      @charset = {}
      @key = args[:key]

      File.open(args[:charset], 'r') do |f|
        f.readlines.map(&:chomp).each { |str| @charset[str[0]] = str[str.rindex(",") + 2..-1] }
      end
    end

    def encrypt plaintext
      plaintext.chars.map do |char| 
        "#{ (@charset[char].to_i + @key) % 99 }"
        .sub(/^[0-9]{1}$/) { |num| "0#{num}" }
      end.join
    end

    def decrypt ciphertext
      plaintext = ""
  
      ciphertext.chars.each_slice(2).map(&:join).each do |char|
        char = char[1..-1] if char[0] == "0"
        char = @charset.invert[(( char.to_i - @key ) % 99 ).to_s ]
        plaintext << char
      end
  
      plaintext
    end
  end

  class LetterLetter
    def initialize(args)
      @charset = {}
      @key = args[:key]

      File.open(args[:charset], 'r') do |f|
        f.readlines.map(&:chomp).each { |str| @charset[str[0]] = str[str.rindex(",") + 2..-1] }
      end
    end

    def encrypt plaintext
      plaintext.chars.map { |char| @charset[char] }.join
    end

    def decrypt ciphertext
      ciphertext.chars.map { |char| @charset.invert[char] }.join
    end
  end
end