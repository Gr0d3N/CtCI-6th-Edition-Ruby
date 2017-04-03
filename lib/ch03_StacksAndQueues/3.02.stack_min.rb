# Page 98
#
# 3.2 Stack Min
# How would you design a stack which, in addition to push and pop, has a
#   function min which returns the miminum element? Push, pop, and min should
#   all operate in O(1) time.
#

# Observation:
#   In order to achieve O(1) time, we can't look through the stack to locate the
#   min value. This implies that we must cache it somewhere.

class Node
  attr_accessor :data, :next
  def initialize(data)
    @data = data
    @next = nil
  end
end

class Stack
  attr_accessor :top, :min

  def set_top(data)
    @top = Node.new(data)
    @min = Node.new(data)
  end

  def is_empty?
    return @top == nil
  end

  def peek
    @top.nil? ? nil : @top.data
  end

  def push(data)
    if self.is_empty?
      set_top(data)
    else
      new_top = Node.new(data)
      new_top.next = @top
      @top = new_top
      if @top.data < @min.data
        new_min = Node.new(@top.data)
        new_min.next = @min
        @min = new_min
      end
    end
  end

  def push_many(array)
    if !array.empty?
      array.each do |i|
        push(i)
      end
    end
  end
 
  def pop
    return nil if self.is_empty?
    top_data =  @top.data
    @top = @top.next
    @min = @min.next if top_data = @min.data #for tracking the minimum
    return top_data
  end

  def to_s
    return nil if self.is_empty?
    current = @top
    str = ""
    while current
      str += "#{current.data} "
      current = current.next
    end
    return str.strip
  end

  def to_a
    return nil if self.is_empty?
    current = @top
    arr = []
    while current
      arr << current.data
      current = current.next
    end
    return arr
  end
end
