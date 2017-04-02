class Node 
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class Queue
  attr_accessor :head, :tail

  def set_head(data)
    @head = Node.new(data)
  end

  def is_empty?
    return @head == nil
  end

  def peek
    @head.nil? ? nil : @head.data
  end

  def add(data)
    if self.is_empty?
      set_head(data)
    elsif @tail.nil?
      @tail = Node.new(data) 
      @head.next = @tail
    else
      new_tail = Node.new(data)
      @tail.next = new_tail
      @tail = new_tail
    end
  end

  def add_many(array)
    if array.length > 0
      array.each do |i|
        add(i)
      end
    end
  end

  def remove
    return nil if self.is_empty?
    head_data = @head.data
    new_head = @head.next
    @head = new_head
    return head_data
  end

  def to_s
    return nil if self.is_empty?
    current = @head
    str = ""
    while current
      str += "#{current.data} "
      current = current.next
    end
    return str.strip
  end

  def to_a
    return nil if self.is_empty?
    current = @head
    arr  = []
    while current
      arr << current.data
      current = current.next
    end
    return arr
  end
end
