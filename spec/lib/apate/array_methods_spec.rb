require 'spec_helper'

describe Apate do
  it 'should be able to multiply 2 arrays' do
    res = Apate.scalar_product([3,2,1], [3,2,1])
    expect(res).to eq(14)
  end

  it 'should be able to subtract a value from an array' do
    res = Apate.subtract [4,3,1], 1
    expected = [3,2,0]

    res.each_with_index do |r, i|
      expect(r).to eq(expected[i])
    end
  end

  it 'should be able to add a value ta an array' do
    res = Apate.add [4,3,1], 1
    expected = [5,4,2]

    res.each_with_index do |r, i|
      expect(r).to eq(expected[i])
    end
  end

  it 'should be able to multiply an array with an scalar' do
    res = Apate.multiply [4,3,1], 2
    expected = [8,6,2]

    res.each_with_index do |r, i|
      expect(r).to eq(expected[i])
    end
  end

  it 'should be able to divide an array by an scalar' do
    res = Apate.divide [4,3,1], 2
    expected = [2,1.5,0.5]

    res.each_with_index do |r, i|
      expect(r).to eq(expected[i])
    end
  end

  it 'should be able to raise each element in an array to a power' do
    res = Apate.pow [4,3,1], 2
    expected = [16,9,1]

    res.each_with_index do |r, i|
      expect(r).to eq(expected[i])
    end

    res = Apate.pow [4,9,1], -1
    expected = [1.0/4,1.0/9,1]

    res.each_with_index do |r, i|
      expect(r).to eq(expected[i])
    end
  end
end