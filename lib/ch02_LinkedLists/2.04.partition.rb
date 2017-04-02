# Page 94
# Partition: Write code to parition a linked list around a value x, such that all nodes less than x come before all nodes greater than or equal to x. If x is contained within the list, the values of x only need to be after the elements less than x. The partition element x can appear anywhere in the "right partition"; it does not need to apear between the left and right partitions.

require_relative "linked_list"

def partition(linked_list, partition_value)
  cursor = linked_list.head
  until cursor.nil?
    if !cursor.next.nil? && cursor.next.data < partition_value
      # save the node
      tmp = cursor.next 
      
      # delete the node from the list
      cursor.next = cursor.next.next

      # move the node to the beginning and replace the head
      tmp.next = linked_list.head
      linked_list.head = tmp
    else
      cursor = cursor.next
    end
  end
  return linked_list
end
