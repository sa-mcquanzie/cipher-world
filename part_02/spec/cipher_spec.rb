require 'cipher'

describe 'Secret' do
  it 'should exist and take one argument' do
    Kernel.const_defined?('Secret')
  end

  before(:each) do 
    @secret = Secret.new('My name is Edward!') 
  end

  describe '#encrypt' do
    context 'When instantiated with "My name is Edward!"' do
      it 'should return the correct value when passed "3"' do
        expect( @secret.encrypt 3 ).to eq '4228317416831222334726421756'
      end

      it 'should return the correct value when passed "7"' do
        expect( @secret.encrypt 7 ).to eq '4632721820127162673811308251160'
      end
    end
  end
end

describe 'String' do
  using Cipher
  it 'should correctly implement the encrypt method' do
    expect( 'My name is Edward!'.encrypt 3 ).to eq '4228317416831222334726421756'
  end
end