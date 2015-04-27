require 'spec_helper'

describe Apate do


  it 'should be able to multiply 2 1x1 matrices' do
    a = [[2]]
    b = [[3]]

    res = Apate.matrix_multiply a, b

    expect(res.length).to eq(1)
    expect(res.first.length).to eq(1)
    expect(res.first.first).to eq(6)
  end

  it 'should be able to multiply 2 2x2 matrices' do
    a = [[1,0], [0,1]]
    b = [[1,2], [3,4]]

    res = Apate.matrix_multiply a, b
    expect(res.length).to eq(2)
    expect(res.first.length).to eq(2)
    expect(res).to eq(b)

  end

  it 'should be able to invert a matrix' do
    a = [[1,2],[2,1]]

    res = Apate.invert_matrix a

    expected = [[1,0], [0,1]]

    expect(res).to eq(expected)

  end

  it 'should be able to compute the determinant of a matrix' do

    a = [[1,0,0],[0,0,1],[0,1,0]]
    #res = Apate.determinant a

    #expect(res).to eq(1)

    a = [[1,1,1],[1,1,1],[1,1,1]]
    res = Apate.determinant a

    expect(res).to eq(0)


  end


  it 'should be able to add 2 2x2 matrices' do
    a = [[1,0], [0,1]]
    b = [[1,2], [3,4]]

    c = [[2,2], [3,5]]

    res = Apate.matrix_add a, b
    expect(res.length).to eq(2)
    expect(res.first.length).to eq(2)
    expect(res).to eq(c)

  end

end