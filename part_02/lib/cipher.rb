module Cipher
  refine String do
    def encrypt num
      dict = (([' '] + ('a'..'z').to_a + ('A'..'Z').to_a + ['!']).zip((0..53).to_a.map { |n| n + num })).to_h
      
      self.chars.map { |char| dict[char] }.join
    end
  end
end

using Cipher

class Secret
  def initialize str
    @str = str
  end

  def encrypt num
    @str.encrypt(num)
  end
end