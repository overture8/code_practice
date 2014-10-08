class Node
  attr_accessor :name, :age, :prev, :next

  def initialize(name, age)
    @name, @age = name, age
  end
end

class DoublyLinkedList
  attr_reader :head

  def is_empty?
    @head.nil?
  end

  def remove(name)
    # ...
  end

  def insert(name, age)
    new_node = Node.new(name, age)
    @head.prev = new_node if @head # 1. Current head's previous node is the new node
    new_node.next = @head          # 2. The new node's next element is the current head
    @head = new_node               # 3. @head becomes the new node
  end

  def all_names
    item_names = []
    item = @head

    until item.nil?
      item_names << item.name
      item = item.next
    end
    item_names
  end
end

D=DoublyLinkedList.new
D.insert('Phil', 35)
D.insert('John', 25)
D.insert('Fred', 15)
