require 'cipher'

describe 'Secret' do
  it 'should exist' do
    Kernel.const_defined?('Secret')
  end
end

# Acceptance Criteria

# secret = Secret.new('My name is Edward!')
# secret.encrypt(3) #=> "4228317416831222334726421756"
# secret.encrypt(7) #=> "4632721820127162673811308251160"

# Bonus
#'My name is Edward!'.encrypt(3) #=> "4228317416831222334726421756"