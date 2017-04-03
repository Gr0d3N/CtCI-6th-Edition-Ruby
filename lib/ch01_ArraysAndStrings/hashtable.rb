class Node
  attr_accessor :key, :value, :next

  def initialize(k, v)
    @key = k
    @value = v
    @next = nil
  end
end

class HashTable
  attr_accessor :buckets, :size, :table_size

  def initialize(table_size)
    @table_size = table_size
    @buckets = Array.new(@table_size)
    @size = 0
  end

  def put(k, v)
    location = k.hash % @table_size
    if buckets[location] == nil
      buckets[location] = Node.new(k, v)
    else
      n = buckets[location]
      while n != nil
        return n.value = v if n.key == k
        p = n
        n = n.next
      end
      p.next = Node.new(k, v)
    end
    @size += 1
  end

  def get(k)
    location = k.hash % @table_size
    n = buckets[location]
    while n != nil && n.key != k
      n = n.next
    end

    if n == nil
      return nil
    else
      return n.value
    end
  end

  def remove(k)
    location = k.hash % @table_size
    n = buckets[location]
    p = nil
    while n != nil && !n.key == k
      p = n
      n = n.next
    end

    return nil if n == nil

    @size -= 1

    if p == nil
      buckets[location] = n.next
    else
      p.next = n.next
    end

    return n.value
  end

  def size
    puts @size
  end

  def is_empty?
    return @size == 0
  end
end
