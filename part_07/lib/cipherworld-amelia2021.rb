#!/usr/bin/env ruby

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

cipher, method, filename, key = ARGV

# Handle bad command line arguments

if ['ln', 'll'].none? cipher
  puts "Unknown Cipher: #{cipher}. Available ciphers are ln and ll"
  return
end

if ['enc', 'dec'].none? method
  puts "Unknown Action: #{method}. Available actions are enc and dec"
  return
end

unless File.file? filename
  puts "No file found ./#{filename}."
  return
end

key = key.to_i ||= 0

# Main Script

newname = method == 'enc' ? "#{filename}.enc" : "#{filename.sub(/\.enc$/, '')}"
text = File.read filename

if cipher == 'ln'
  lnc = Cipher::LetterNumber.new(charset: 'lnc.txt', key: key)
  result = method == 'enc' ? lnc.encrypt(text) : lnc.decrypt(text)
else
  llc = Cipher::LetterLetter.new(charset: 'llc.txt')
  result = method == 'enc' ? llc.encrypt(text) : llc.decrypt(text)
end

File.write(newname, result)