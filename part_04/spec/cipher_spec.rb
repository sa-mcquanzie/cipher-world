require 'cipher'

describe 'Secret' do
  it 'should exist and take one argument' do
    Kernel.const_defined?('Secret')
    test = Secret.new "Testing, 1... 2... 3..!"
  end

  describe '#encrypt' do
    context 'When a new instance of Secret is created' do
      it 'should exist as a method of the Secret class and take one argument' do
        Secret.new('Test').encrypt(42)
      end
    end

    context 'When called on Secret.new("0")' do
      it 'should return "43" when passed 45' do
        plaintext, key, ciphertext = '0', 45, '43'
        expect(Secret.new(plaintext).encrypt(key)).to eq ciphertext
      end
    end

    context 'When called on Secret.new("Look over there!")' do
      it 'should return the right answer when passed 2374' do
        plaintext, key, ciphertext = 'Look over there!', 2374, '37141410981421041798190704170452'
        expect(Secret.new(plaintext).encrypt(key)).to eq ciphertext
      end

      it 'should return the right answer when passed 2473' do
        plaintext, key, ciphertext = 'Look over there!', 2473, '37141410981421041798190704170452'
        expect(Secret.new(plaintext).encrypt(key)).to eq ciphertext
      end

      it 'should return the right answer when passed 2572' do
        plaintext, key, ciphertext = 'Look over there!', 2572, '37141410981421041798190704170452'
        expect(Secret.new(plaintext).encrypt(key)).to eq ciphertext
      end
    end

    context 'When called on Secret.new("HELLO, 28 $$$!")' do
      it 'should return the right answer when passed 7' do
        plaintext, key, ciphertext = 'HELLO, 28 $$$!', 7, '4239464649850896030864646461'
        expect(Secret.new(plaintext).encrypt(key)).to eq ciphertext

      end
    end

    context 'When called on Secret.new("       ")' do
      it 'should return the right answer when passed 20' do
        plaintext, key, ciphertext = '       ', 20, '21212121212121'
        expect(Secret.new(plaintext).encrypt(key)).to eq ciphertext
      end
    end

    context "When called on Secret.new('\' a double quote can be tricky, as can be \\ backslashes)" do
      it 'should return the right answer when passed 43' do
        plaintext = "'\"' a double quote can be tricky, as can be \\ backslashes"
        key = 43
        ciphertext = '181918444544485965465649446165596449444745584446494464625347556922444563444745584446494420444645475563564563524963'
        expect(Secret.new(plaintext).encrypt(key)).to eq ciphertext
      end
    end
  end
end

describe 'EncryptedSecret' do
  it 'should exist and take one argument' do
    Kernel.const_defined?('EncryptedSecret')
    test = EncryptedSecret.new "Testing, 1... 2... 3..!"
  end

  describe '#decrypt' do
    context 'When a new instance of EncryptedSecret is created' do
      it 'should exist as a method of the EncryptedSecret class and take one argument' do
        EncryptedSecret.new('Test').decrypt(42)
      end
    end

    context 'When passed the ciphertext for "0"' do
      it 'should decrypt it when encrypted with key 45' do
        plaintext, key = '0', 45
        expect(EncryptedSecret.new(Secret.new(plaintext).encrypt(key)).decrypt(key)).to eq plaintext
      end
    end

    context 'When passed the ciphertext for "Look over there!"' do
      it 'should decrypt it when encrypted with key 2374' do
        plaintext, key = 'Look over there!', 2374
        expect(EncryptedSecret.new(Secret.new(plaintext).encrypt(key)).decrypt(key)).to eq plaintext
      end

      it 'should decrypt it when encrypted with key 2473' do
        plaintext, key = 'Look over there!', 2473
        expect(EncryptedSecret.new(Secret.new(plaintext).encrypt(key)).decrypt(key)).to eq plaintext
      end

      it 'should decrypt it when encrypted with key 2572' do
        plaintext, key = 'Look over there!', 2572
        expect(EncryptedSecret.new(Secret.new(plaintext).encrypt(key)).decrypt(key)).to eq plaintext
      end
    end

    context 'When passed the ciphertext for "HELLO, 28 $$$!"' do
      it 'should decrypt it when encrypted with key 7' do
        plaintext, key = 'HELLO, 28 $$$!', 7
        expect(EncryptedSecret.new(Secret.new(plaintext).encrypt(key)).decrypt(key)).to eq plaintext
      end
    end

    context 'When passed the ciphertext for "       "' do
      it 'should decrypt it when encrypted with key 20' do
        plaintext, key = '       ', 20
        expect(EncryptedSecret.new(Secret.new(plaintext).encrypt(key)).decrypt(key)).to eq plaintext
      end
    end

    context "When passed the ciphertext for '\' a double quote can be tricky, as can be \\ backslashes''" do
      it 'should decrypt it when encrypted with key 43' do
        plaintext = "'\"' a double quote can be tricky, as can be \\ backslashes"
        key = 43
        expect(EncryptedSecret.new(Secret.new(plaintext).encrypt(key)).decrypt(key)).to eq plaintext
      end
    end
  end
end