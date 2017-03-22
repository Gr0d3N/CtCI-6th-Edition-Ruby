# Page 223
# Return Kth to Last: Implement an algorithm to  nd the kth to last element of a singly linked list.

require_relative "linked_list"

def kth_to_last(linked_list, k)
  r1 = linked_list.head
  r2 = linked_list.head

  k.times { r1 = r1.next }

  while r1.next 
    r1 = r1.next
    r2 = r2.next
  end

  return r2
end
