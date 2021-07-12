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

# Acceptance Criteria

# secret = Secret.new('My name is Edward!')
# secret.encrypt(3) #=> "4228317416831222334726421756"
# secret.encrypt(7) #=> "4632721820127162673811308251160"

# Bonus
#'My name is Edward!'.encrypt(3) #=> "4228317416831222334726421756"