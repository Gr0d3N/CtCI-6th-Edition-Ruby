# Page 99
# 3.3 Stack of Plates
# Imagine a literal stack of plates. If the stack gets too high, it might
#   topple. Therefore, in real life, we would likely start a new stack when the
#   previous stack exceeds some threshold. Implement a data structure
#   SetOfStacks that mimics this. SetOfStacks should be composed of several
#   stacks and should create a new stack once the previous one exceeds capacity.
#   SetOfStacks.push() and SetOfStacks.pop() should behave identically to a
#   single stack (that is, pop() should return the same values as it would if
#   there were just a single stack).
# 
# FOLLOW UP: Implement a function
#   pop_at(index) which performs a pop operation on a specific sub-stack.
# 
#
# Maintains multiple stacks that behave as one

class StackOfStacks
  attr_accessor :stacks

  def initialize(max_size)
    @max_size = max_size
    @stacks = [[]]
  end

  def push(value)
    stacks << [] if stacks.last.length >= @max_size
    stacks.last << value
  end

  def pop
    temp = stacks.last.pop
    stacks.pop if stacks.last.empty? && stacks.length > 1
    return temp
  end

  def pop_at(stack_index)
    temp = stacks[stack_index].pop
    if stacks[stack_index].empty? && stacks.length > 1
      stacks.delete_at(stack_index)
    end
    return temp
  end
end
