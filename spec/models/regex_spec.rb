require 'rails_helper'

RSpec.describe Regex, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
  context 'validation tests' do # sanity check for the model/schema
    it 'ensures name presence' do
      reg = Regex.new(expression:'test', tag: 'test').save
      expect(reg).to eq(false)
    end

    it 'ensures expression presence' do
      reg = Regex.new(title:'test', tag: 'test').save
      expect(reg).to eq(false)
    end

    it 'should save successfully' do
      reg = Regex.new(title:'test', expression: 'test').save
      expect(reg).to eq(true)
    end
  end

  context 'test function check_integrity()' do
    it 'should behaves correctly when there is no input' do
      expect(Regex.check_integrity('test','')).to eq("No input.")
    end
    it 'should behaves correctly when it matches' do
      expect(Regex.check_integrity('test','This is test.')).to eq("Matches!")
    end
    it 'should behaves correctly when it does not match' do
      expect(Regex.check_integrity('test','no match')).to eq("No match!")
    end
  end
end


