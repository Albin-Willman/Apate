module Apate

  def self.matrix_multiply(a, b)
    am = Matrix.new(a)
    bm = Matrix.new(b)

    (am*bm).data
  end

  def self.matrix_add(a, b)
    am = Matrix.new(a)
    bm = Matrix.new(b)

    (am+bm).data
  end

  def self.invert_matrix(a)
    am = Matrix.new(a)
    am.invert.data
  end


  def self.determinant(a)
    am = Matrix.new(a)
    det = am.determinant

    det
  end

  class Matrix

    def self.create_empty(rows, cols)
      arr = Array.new(rows).map { |_| Array.new(cols) }
      Matrix.new(arr)
    end

    def initialize arr
      @rows = arr.length
      @cols = arr[0].length
      @data = arr
    end

    def data
      @data
    end

    def data= d
      @data = d
    end

    def rows
      @rows
    end

    def cols
      @cols
    end

    def set row, col, value
      return nil if row >= @rows || col >= cols
      @data[row][col] = value
    end

    def get row, col
      @data[row][col]
    end

    def get_columns
      columns = Array.new(cols).map { |_| Array.new(rows) }
      data.each_with_index do |row, row_i|
        row.each_with_index do |e, col_i|
          columns[col_i][row_i] = e
        end
      end
      columns
    end

    def + b
      c = Matrix.create_empty rows, cols

      data.each_with_index do |row, row_i|
        b.get_columns.each_with_index do |col, col_i|
          c.set(row_i, col_i, get(row_i, col_i) + b.get(row_i, col_i))
        end
      end
      c
    end

    def * b
      c = Matrix.create_empty rows, b.cols
      data.each_with_index do |row, row_i|
        b.get_columns.each_with_index do |col, col_i|
          c.set(row_i, col_i, Apate.scalar_product(row, col))
        end
      end
      c
    end

    def determinant
      fail 'Non square matrix' unless rows == cols
      return data[0][0] if rows == 1
      det = 0

      data.each_with_index do |_, row_i|
        cell = get(row_i, 0)
        next if cell == 0
        b = get_sub_matrix_without_row_and_col0(row_i)
        b_det = b.determinant
        det += ((-1)**row_i)*cell*b_det
      end
      det
    end

    def get_sub_matrix_without_row_and_col0(row)
      b = Matrix.create_empty rows-1, cols-1
      ranges = get_range_pair rows, row
      if ranges[:first] && ranges[:second]
        b.data = sub_matrix(1..cols-1, ranges[:first])
        b.append_cols(sub_matrix(1..cols-1, ranges[:second]))
      elsif ranges[:first]
        b.data = sub_matrix(1..cols-1, ranges[:first])
      elsif ranges[:second]
        b.data = sub_matrix(1..cols-1, ranges[:second])
      end
      b
    end

    def sub_matrix(col_range, row_range)
      data[col_range].map { |c| c[row_range] }
    end

    def invert
      ai = Matrix.create_empty rows, cols

    end

    def print
      data.each do |row|
        puts "| #{row.join(' | ')} |\n"
        puts '-'*cols*3
      end
    end

    def append_cols(append_data)
      data.each_with_index do |row, i|
        data[i] = row + append_data[i]
      end
    end

    private

      def get_range_pair(max, index)
        return if max == 0 || index >= max
        pair = {first: nil, second: nil}
        real_max = max-1
        if index == 0
          pair[:second] = (1..real_max)
        elsif index == (real_max)
          pair[:first] = (0..real_max-1)
        else
          pair[:first] = (0..index-1)
          pair[:second] = (index+1..real_max)
        end
        pair
      end

  end
end