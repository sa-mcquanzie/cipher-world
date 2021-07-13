require 'cipher'

describe 'Secret' do
  it 'should exist and take one argument' do
    Kernel.const_defined?('Secret')
    test = Secret.new "Testing, 1... 2... 3..!"
  end

  
end


# Acceptance Criteria

# Secret.new('0').encrypt(45) #=> '43'
# Secret.new('Look over there!').encrypt(2374) #=> "37141410981421041798190704170452"
# Secret.new('Look over there!').encrypt(2473) #=> "37141410981421041798190704170452"
# Secret.new('Look over there!').encrypt(2572) #=> "37141410981421041798190704170452"
# Secret.new('HELLO, 28 $$$!').encrypt(7) #=> "4239464649850896030864646461"
# Secret.new('       ').encrypt(20) #=> "21212121212121"
# Secret.new("'\"' a double quote can be tricky, as can be \\ backslashes").encrypt(43) #=> "181918444544485965465649446165596449444745584446494464625347556922444563444745584446494420444645475563564563524963"