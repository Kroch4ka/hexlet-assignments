# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN

  def setup
    @stack = Stack.new([1, 2, 3])
  end

  def test_size
    assert { @stack.size == 3 }
  end

  def test_pop
    @stack.pop!
    assert { @stack.size == 2 }
  end

  def test_push
    @stack.push!(4)
    assert { @stack.size == 4 }
  end

  def test_to_a
    assert { @stack.to_a.instance_of?(Array) }
  end

  def test_clear
    @stack.clear!
    assert { @stack.to_a.empty? }
  end

  def test_empty
    @stack.clear!
    assert { @stack.empty? }
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
