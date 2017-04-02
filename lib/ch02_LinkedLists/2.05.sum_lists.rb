# Page 95
# Sum List: You have 2 numbers represented by a linked list, where each node contains 
# single digits. The digits are stored in reverse order, such that the 1s digit is at
# the head of the list. Write a function that adds the 2 numbers and returns the sum as a
# linked list. 
# Example
# Input 7 1 6 + 5 9 2 . That is 617 + 295.
# Output 2 1 9 . That is 912
#
# Follow up
# Suppose the digits are stored in forward order. Repeat the above problem.
# Input 6 1 7 + 2 9 5 . That is 617 + 295.
# Output 9 1 2 . That is 912

# Discussion:
#   When the values are stored in reverse, this problem can be solved
#   iteratively by storing the carry value as it goes.
#
# Time complexity: O([node1.length, node2.length].max) since it will iterate
#   until the last value of the longest list
# Space complexity: The total will have a number of nodes equal to number of
#   digits in the sum of the arguments.
#

require_relative 'linked_list'

def sum_list(linked_list1, linked_list2)
  node1 = linked_list1.head
  node2 = linked_list2.head
  carry = 0
  total = LinkedList.new

  until node1.nil? && node2.nil?
    # If the numbers do not have the same number of digits, consider the digit to be zero
    val1 = node1.nil? ? 0 : node1.data
    val2 = node2.nil? ? 0 : node2.data

    sum = val1 + val2 + carry
    total.append(sum % 10)
    carry = sum / 10

    # Move to the next digit
    node1 = node1.next unless node1.nil?
    node2 = node2.next unless node2.nil?
  end

  # Add the last carry only if exist
  total.append(carry) if carry > 0
  return total
end

# When the values are stored in forward order, several additional challenges
#   arise:
#     1. The digits in each argument are no longer aligned
#     2. The carry value cannot be passed forward
#   To address these issues, we can pad the shorter value with zeros, then use
#   recursion to pass the carry value backwards.
#
def sum_lists_forward(node1, node2)
  # Determine lengths and pad shorter list
  length1 = list_length(node1)
  length2 = list_length(node2)
  node1 = pad_list(node1, length2 - length1) if length2 > length1
  node2 = pad_list(node2, length1 - length2) if length1 > length2

  # Result includes the partial sum and possibly a carry value
  result = recursive_add(node1, node2)
  sum = result[:partial_sum]

  # If there's a remaining carry value, insert it at the beginning of the list
  if result[:carry].positive?
    carry_node = LinkedList::Node.new(result[:carry])
    carry_node.next = sum
    sum = carry_node
  end

  # The partial sum is now the total
  sum
end

def recursive_add(node1, node2)
  # When at the end of the list, stop recursing; we know the values
  if node1.next.nil?
    partial_result = { partial_sum: nil, carry: 0 }
  else
    partial_result = recursive_add(node1.next, node2.next)
  end
  sum = node1.data + node2.data + partial_result[:carry]
  carry = sum / 10
  sum_node = LinkedList::Node.new(sum % 10)
  sum_node.next = partial_result[:partial_sum]
  { partial_sum: sum_node, carry: carry }
end

def pad_list(node, pad_amount)
  pad_amount.times do
    zero_node = LinkedList::Node.new(0)
    zero_node.next = node
    node = zero_node
  end
  node
end

def list_length(node)
  i = 0
  until node.nil?
    i += 1
    node = node.next
  end
  i
end


