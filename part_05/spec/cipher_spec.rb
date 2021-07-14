require 'cipher'

describe 'Cipher' do
  before(:each) do 
    @charset1 = 'lib/character_set1.txt'
    @charset2 = 'lib/character_set2.txt'
    @plaintext = 'Look over there!'
    @ciphertext = '37141410981421041798190704170452'
    @key = 2374
  end 

  describe '::LetterNumber' do
    it 'should succesfully encrypt plaintext' do
      @letter_number_cipher = Cipher::LetterNumber.new(charset: @charset1, key: @key)
      expect(@letter_number_cipher.encrypt(@plaintext)).to eq @ciphertext
    end

    it 'should succesfully decrypt ciphertext' do
      @letter_number_cipher = Cipher::LetterNumber.new(charset: @charset1, key: @key)
      expect(@letter_number_cipher.decrypt(@ciphertext)).to eq @plaintext
    end
  end

  # describe '::LetterLetter' do
  #   it '' do

  #   end
  # end
end


### Acceptance Criteria

# char_set1 = # something that represents character set 1
# char_set2 = # something that represents the character set 2
# original_plain_text = 'Look over there!'
# key = 2374

## Letter Number test case
# letter_number_cipher = Cipher::LetterNumber.new(char_set: char_set1, key: key)
# p letter_number_cipher.encrypt(original_plain_text) #=> "37141410981421041798190704170452"
# p letter_number_cipher.decrypt("37141410981421041798190704170452") #=> 'Look over there!'

## Letter Letter test case
# letter_letter_cipher = Cipher::LetterLetter.new(char_set: char_set2)
# p letter_letter_cipher.encrypt(original_plain_text) #=> "B!!ym!9DAm2§DAD "
# p letter_letter_cipher.decrypt("B!!ym!9DAm2§DAD ") #=> 'Look over there!'

## Encryption suite test case
# ciphers = [letter_number_cipher, letter_letter_cipher]
# ciphers.each do |cipher|
#   cipher_text = cipher.encrypt(original_plain_text)
#   plain_text = cipher.decrypt(cipher_text)
#   puts "#{cipher.class} encryption: #{original_plain_text == plain_text}"
# end

# expected output
# Cipher::LetterNumber encryption: true
# Cipher::LetterLetter encryption: true