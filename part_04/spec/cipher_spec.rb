require 'cipher'

describe 'Secret' do
  it 'should exist and take one argument' do
    Kernel.const_defined?('Secret')
    test = Secret.new "Testing, 1... 2... 3..!"
  end

  describe '#encrypt' do
    context 'When a new instance of Secret is created' do
      it 'should exist as a method of the Secret class and take one argument' do
        Secret.new("Test").encrypt(42)
      end
    end

    context 'When called on Secret.new("0")' do
      it 'should return "43" when passed 45' do
        expect(Secret.new('0').encrypt(45)).to eq '43'
      end
    end

    context 'When called on Secret.new("Look over there!")' do
      it 'should return the right answer when passed 2374' do
        expect(Secret.new('Look over there!').encrypt(2374)).to eq '37141410981421041798190704170452'
      end

      it 'should return the right answer when passed 2473' do
        expect(Secret.new('Look over there!').encrypt(2473)).to eq '37141410981421041798190704170452'
      end

      it 'should return the right answer when passed 2572' do
        expect(Secret.new('Look over there!').encrypt(2572)).to eq '37141410981421041798190704170452'
      end
    end

    context 'When called on Secret.new("HELLO, 28 $$$!")' do
      it 'should return the right answer when passed 7' do
        expect(Secret.new('HELLO, 28 $$$!').encrypt(7)).to eq '4239464649850896030864646461'
      end
    end

    context 'When called on Secret.new("       ")' do
      it 'should return the right answer when passed 20' do
        expect(Secret.new('       ').encrypt(20)).to eq '21212121212121'
      end
    end

    context "When called on Secret.new('\' a double quote can be tricky, as can be \\ backslashes)" do
      it 'should return the right answer when passed 43' do
        expect(Secret.new("'\"' a double quote can be tricky, as can be \\ backslashes")
        .encrypt(43)).to eq '181918444544485965465649446165596449444745584446494464625347556922444563444745584446494420444645475563564563524963'
      end
    end
  end
end

describe 'EncryptedSecret' do
  it 'should exist and take one argument' do
    Kernel.const_defined?('EncryptedSecret')
    test = EncryptedSecret.new "Testing, 1... 2... 3..!"
  end
end