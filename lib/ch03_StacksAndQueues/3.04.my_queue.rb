# Page 99
# 3.4 Queue via Stacks
# Implement a MyQueue class which implements a queue using two stacks
#

# Discussion:
#   Two stacks can be used such that the first is filled when items are queued,
#   and the second is depleted when items are dequeued. When the dequeueing
#   stack is empty, and a pop operation is made, the items from the queueing
#   stack are popped off and pushed onto the dequeueing stack.

require_relative 'stack'

class MyQueue
  def initialize
    @stacks = [Stack.new, Stack.new]
  end

  def add(value)
    @stacks[0].push(value)
  end

  def remove
    fill_dequeue_stack if @stacks[1].peek.nil?
    @stacks[1].pop
  end

  def to_a
    @stacks[0].to_a.reverse + stacks[1].to_a # not sure if this is correct
  end

  private

  def fill_dequeue_stack
    @stacks[1].push(@stacks[0].pop) until @stacks[0].peek.nil?
  end
end
