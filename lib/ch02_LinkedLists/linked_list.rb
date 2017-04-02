class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  def set_head(data)
    @head = Node.new(data)
  end

  def append_many(array)
    if array.length > 0
      array.each do |i|
        self.append(i)
      end
    end
  end

  def append(data)
    if head.nil?
      @head = Node.new(data)
    else
      current = @head
      while current.next != nil
        current = current.next
      end
      current.next = Node.new(data)
    end
  end

  def prepend(data)
    if head.nil?
      @head = Node.new(data)
    else
      new_head = Node.new(data)
      new_head.next = @head
      @head = new_head
    end
  end

  def delete(data)
    if @head.data == data
      @head = @head.next
    else
      current = @head
      while current.next != nil
        current.next = current.next.next if current.next.data == data
        current = current.next
      end
    end
  end

  def to_s
    current = @head
    str = ""
    while current
      str += "#{current.data} "
      current = current.next
    end
    return str.strip
  end
end
