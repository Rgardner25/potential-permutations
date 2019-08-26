require 'rspec'

class BinarySwapper
  def initialize(binary_string:)
    @str = binary_string
  end

  def number_of_question_marks
    @str.scan(/\?/).count
  end

  def combination_of_binary_nums
    ['0', '1'].repeated_permutation(number_of_question_marks).to_a
  end

  def indices_of_question_marks
    @str.enum_for(:scan, /\?/).map { Regexp.last_match.begin(0) }
  end

  def binary_question_mark_filler
    indices = indices_of_question_marks
    combination_of_binary_nums.each_with_object([]) do |combination, arr|
      indices.each_with_index do |str_index, idx|
        @str[str_index] = combination[idx]
      end

      arr << @str.clone
    end
  end
end
