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
  end
end