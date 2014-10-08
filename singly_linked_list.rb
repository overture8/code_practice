class Node
  attr_accessor :name, :age, :next

  def initialize(name, age)
    @name, @age = name, age
  end
end

class SinglyLinkedList
  def initialize
    @head = nil
  end

  def head
    @head
  end

  def is_empty?
    @head.nil?
  end

  def remove(name)
    # ...
  end

  def from_last(k, node=nil)
    node ||= @head
    return 0 if node.nil?

    puts from_last(k, node.next)

    puts i

    if i == k
      puts node.name
    end

    return i
  end

  def unique!
    node = @head
    prev = nil
    buffer = []

    until node.nil?
      if buffer.include? node.name
        prev.next = node.next
      else
        buffer << node.name
        prev = node
      end
      node = node.next
    end
  end

  def insert(name, age)
    new_node = Node.new(name, age)
    new_node.next = @head
    new_node.next = @head          # 1. The new node's next element is the current head
    @head = new_node               # 2. @head becomes the new node
  end

  def reverse_using_iteration
    item = @head
    prev = nil

    until item.nil?
      next_item = item.next        # 1. Store *current* item link to the *next* element
      item.next = prev             # 2. Change *current* item next link to *previous* element
      prev = item                  # 3. Store *current* item in prev var to be used in next iteration
      item = next_item             # 4. Set *current* item to be the next item and the iteration continues until item == nil
    end
    @head = prev                   # 5. Set *head* to be prev (which is the last item)
  end

  def reverse_using_recursion(node=nil)
    node ||= @head

    if node.next.nil?
      @head = node
      return
    end

    reverse_using_recursion(node.next)

    node.next.next = node
    node.next = nil
  end

  def print
    item_names = []
    item = @head

    until item.nil?
      item_names << item.name
      item = item.next
    end
    item_names
  end
end

S=SinglyLinkedList.new
S.insert('A', 35)
S.insert('B', 25)
S.insert('C', 15)
S.insert('A', 19)
S.insert('A', 19)
S.insert('A', 19)
S.insert('C', 19)
