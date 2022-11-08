require 'rails_helper'

RSpec.describe Testcase, type: :model do
  context 'validation tests' do # sanity check for the model/schema
    
    it 'ensures content presence' do
      testcase = Testcase.new(regex_id: 1, match: 'true').save
      expect(testcase).to eq(false)
    end

    it 'ensures match presence' do
      testcase = Testcase.new(regex_id: 1, content: 'test').save
      expect(testcase).to eq(false)
    end

    it 'should save successfully' do
      testcase = Testcase.new(regex_id: 1, content: 'test', match: 'true').save
      expect(testcase).to eq(true)
    end
  end
end
