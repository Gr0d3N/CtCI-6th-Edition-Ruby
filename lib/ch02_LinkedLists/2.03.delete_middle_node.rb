# Page 94
# Delete Middle Node: Implement an algorithm to delete a node in the middle (i.e., any node but the  first and last node, not necessarily the exact middle) of a singly linked list, given only access to that node.
# EXAMPLE
# Input:the node c from the linked list a->b->c->d->e->f
# Result: nothing is returned, but the new linked list looks like a->b->d->e->f

require_relative "linked_list"

def delete_middle_node(node)
  node.data = node.next.data
  node.next = node.next.next
end
