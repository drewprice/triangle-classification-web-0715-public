require 'pry'

class TriangleError < StandardError
end

class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    validate
  end

  def kind
    if equilateral?
      :equilateral
    elsif scalene?
      :scalene
    else
      :isosceles
    end
  end

  private

  def equilateral?
    @sides.all? { |e| e == @sides.first }
  end

  def scalene?
    @sides.uniq.size == 3
  end

  def validate
    fail TriangleError, 'illegal side length' if illegal_length || inequality
  end

  def illegal_length
    @sides.any? { |e| e <= 0 }
  end

  def inequality
    sum = @sides.reduce { |a, e| a + e }
    @sides.any? { |e| e >= (sum - e) }
  end
end
