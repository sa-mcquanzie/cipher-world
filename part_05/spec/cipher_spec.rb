require 'cipher'

describe 'Cipher' do
  before(:each) do 
    @charset1 = 'lib/character_set1.txt'
    @charset2 = 'lib/character_set2.txt'
    @plaintext = 'Look over there!'
    @number_ciphertext = '37141410981421041798190704170452'
    @letter_ciphertext = 'B!!ym!9DAm2§DAD '
    @key = 2374
  end 

  describe '::LetterNumber' do
    it 'should succesfully encrypt plaintext' do
      @letter_number_cipher = Cipher::LetterNumber.new(charset: @charset1, key: @key)
      expect(@letter_number_cipher.encrypt(@plaintext)).to eq @number_ciphertext
    end

    it 'should succesfully decrypt ciphertext' do
      @letter_number_cipher = Cipher::LetterNumber.new(charset: @charset1, key: @key)
      expect(@letter_number_cipher.decrypt(@number_ciphertext)).to eq @plaintext
    end
  end

  describe '::LetterLetter' do
    it 'should succesfully encrypt plaintext' do
      @letter_letter_cipher = Cipher::LetterLetter.new(charset: @charset2)
      expect(@letter_letter_cipher.encrypt(@plaintext)).to eq @letter_ciphertext
    end

    it 'should succesfully decrypt ciphertext' do
      @letter_letter_cipher = Cipher::LetterLetter.new(charset: @charset2)
      expect(@letter_letter_cipher.decrypt(@letter_ciphertext)).to eq @plaintext
    end
  end
end