require 'cipher'

describe 'Secret' do
  it 'should exist and take one argument' do
    Kernel.const_defined?('Secret')
    test = Secret.new "Testing, 1... 2... 3..!"
  end
end

describe 'EncryptedSecret' do
  it 'should exist and take one argument' do
    Kernel.const_defined?('EncryptedSecret')
    test = EncryptedSecret.new "Testing, 1... 2... 3..!"
  end
end