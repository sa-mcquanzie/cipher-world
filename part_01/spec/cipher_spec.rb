require 'cipher'

describe 'encrypt' do
  context 'When tested against the acceptance criteria' do
    it 'should return "4" when passed ("a", 3)', :fixed => true do
      expect( encrypt('a', 3) ).to eq '4'
    end
    it 'should return "11" when passed ("a", 10)', :fixed => true do
      expect( encrypt('a', 10) ).to eq '11'
    end
    it 'should return "5" when passed ("b", 3)', :fixed => true do
      expect( encrypt('b', 3) ).to eq '5'
    end
    it 'should return "456" when passed ("abc", 3)', :fixed => true do
      expect( encrypt('abc', 3) ).to eq '456'
    end
    it 'should return "43645" when passed ("a cab", 3)', :fixed => true do
      expect( encrypt('a cab', 3) ).to eq '43645'
    end
  end
end