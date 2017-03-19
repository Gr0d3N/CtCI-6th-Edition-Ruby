# Page 94
# Remove Dups: Write code to remove duplicates from an unsorted linked list.
# FOLLOW UP
# How would you solve this problem if a temporary bu er is not allowed?

require_relative "linked_list"

def remove_dups(linked_list)
  dups = Hash.new()

  current = linked_list.head

  while current.next != nil
    if dups[current.data].nil?
      dups[current.data] = true
      current = current.next
    else
      current.data = current.next.data
      current.next = current.next.next
    end
  end

  return linked_list
end
