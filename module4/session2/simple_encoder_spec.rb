require_relative './test_helper'
require_relative './simple_encoder'

describe SimpleEncoder do
    it 'should return empty string' do
        simpleEncoder = SimpleEncoder.new
        encoded = simpleEncoder.encode('')
        expect(encoded).to eq('')
    end
    it 'should encode b to k' do
        simpleEncoder = SimpleEncoder.new
        encoded = simpleEncoder.encode('b')
        expect(encoded).to eq('k')
    end
    it 'should encode z to i' do
        simpleEncoder = SimpleEncoder.new
        encoded = simpleEncoder.encode('z')
        expect(encoded).to eq('i')
    end
    it 'should encode u to i' do
        simpleEncoder = SimpleEncoder.new
        encoded = simpleEncoder.encode('u')
        expect(encoded).to eq('p')
    end
    it 'should encode a to v' do
        simpleEncoder = SimpleEncoder.new
        encoded = simpleEncoder.encode('a')
        expect(encoded).to eq('v')
    end
    it 'should encode homework to qjvzfjat' do
        simpleEncoder = SimpleEncoder.new
        encoded = simpleEncoder.encode('homework')
        expect(encoded).to eq('qjvzfjat')
    end
end