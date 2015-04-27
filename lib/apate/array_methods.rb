module Apate

  def self.subtract(element, value)
    self.element_wise_computing(:-, element, value)
  end

  def self.add(element, value)
    self.element_wise_computing(:+, element, value)
  end

  def self.multiply(element, value)
    self.element_wise_computing(:*, element, value)
  end

  def self.divide(element, value)
    self.element_wise_computing(:/, element, value.to_f)
  end

  def self.pow(element, value)
    self.element_wise_computing(:**, element, value.to_f)
  end


  def self.scalar_product x, y
    return unless x.length == y.length
    value = 0

    x.each_with_index do |xi, i|
      value += xi*y[i]
    end
    value
  end

  private

    def self.element_wise_computing method, elements, value
      if elements.kind_of?(Array)
        elements.map do |e|
          self.element_wise_computing(method, e, value)
        end
      else
        elements.send(method, value)
      end
    end

end