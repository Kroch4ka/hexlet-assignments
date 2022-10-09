# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return nil if num.negative?
  return 0 if num.zero?
  return 1 if [1, 2].include?(num)

  first = 1
  second = 1
  counter = 2

  while counter < num
    result = first + second
    first = second
    second = result

    counter += 1
  end

  second
end
# END
