# frozen_string_literal: true

# BEGIN
def fizz_buzz(start, stop)
  return if start > stop

  result = []
  start.upto(stop) do |num|
    if (num % 3).zero? || (num % 5).zero?
      result << 'FizzBuzz' if (num % 3).zero? && (num % 5).zero?
      result << 'Fizz' if (num % 3).zero?
      result << 'Buzz' if (num % 5).zero?
    else
      result << num
  end
  result.join(' ')
end
# END
