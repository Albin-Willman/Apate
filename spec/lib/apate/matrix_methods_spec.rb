require 'spec_helper'

describe Apate do


  it 'can multiply 2 1x1 matrices' do
    a = [[2]]
    b = [[3]]

    res = Apate.matrix_multiply a, b

    expect(res.length).to eq(1)
    expect(res.first.length).to eq(1)
    expect(res.first.first).to eq(6)
  end

  it 'can multiply 2 2x2 matrices' do
    a = [[1,0], [0,1]]
    b = [[1,2], [3,4]]

    res = Apate.matrix_multiply a, b
    expect(res.length).to eq(2)
    expect(res.first.length).to eq(2)
    expect(res).to eq(b)

  end

  # it 'can invert a matrix' do
  #   a = [[1,2],[2,1]]

  #   res = Apate.invert_matrix a

  #   expected = [[1,0], [0,1]]

  #   expect(res).to eq(expected)

  # end
  context 'determinants' do
    it 'can compute the determinant of a eigenmatrix' do
      a = [[1,0,0],[0,1,0],[0,0,1]]
      res = Apate.determinant a
      expect(res).to eq(1)
    end

    it 'can compute a negative determinant' do
      a = [[0,1],[1,0]]
      res = Apate.determinant a
      expect(res).to eq(-1)

      a = [[1,0,0],[0,0,1],[0,1,0]]
      res = Apate.determinant a
      expect(res).to eq(-1)
    end

    it 'can compute the determinant of a singular matrix' do
      a = [[1,1,1],[1,1,1],[1,1,1]]
      res = Apate.determinant a
      expect(res).to eq(0)
    end

    it 'raises error if matrix is not square' do
      a = [[1,1,1],[1,1,1]]
      expect { Apate.determinant(a)}.to raise_error
    end
  end

  it 'can add 2 2x2 matrices' do
    a = [[1,0], [0,1]]
    b = [[1,2], [3,4]]

    c = [[2,2], [3,5]]

    res = Apate.matrix_add a, b
    expect(res.length).to eq(2)
    expect(res.first.length).to eq(2)
    expect(res).to eq(c)
  end
end