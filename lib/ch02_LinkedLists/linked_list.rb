class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize(data)
    @head = Node.new(data)
  end

  def linked_list(array)
    if array.length > 0
      array.each do |i|
        self.append(i)
      end
    end
  end

  def append(data)
    @head = Node.new(data) if head.nil?
    current = @head
    while current.next != nil
      current = current.next
    end
    current.next = Node.new(data)
  end

  def prepend(data)
    @head = Node.new(data) if head.nil?
    new_head = Node.new(data)
    new_head.next = @head
    @head = new_head
  end

  def delete(data)
    @head = @head.next if @head.data == data
    current = @head
    while current.next != nil
      puts current.next.data
      current.next = current.next.next if current.next.data == data
      current = current.next
    end
  end

  def to_str
    current = @head
    str = ""
    while current
      str += "#{current.data}"
      current = current.next
    end
    return str.strip
  end
end
