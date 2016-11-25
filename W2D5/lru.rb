require 'byebug'
class LRUCache
  attr_reader :max
  attr_accessor :cache, :list

  def initialize(max = 5)
    @cache = {}
    @list = LinkedList.new
    @max = max
  end

  def count
    # returns number of elements currently in cache
    @cache.size
  end

  def add(el)
    # byebug
    # adds element to cache according to LRU principle
    if @cache[el].nil?
      remove_tail if count == @max
      add_new_node_to_head(Node.new(el))
    else
      if list.tail == @cache[el]
        remove_tail
        add_new_node_to_head(Node.new(el))
      else
        move_existing_node_to_head(@cache[el]) unless list.head == @cache[el]
      end
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    current = list.tail
    until current.nil?
      p current.value
      current = current.previous_node
    end

  end

  private
  # helper methods go here!
  def move_existing_node_to_head(working_node)
    # byebug
    next_node = working_node.next_node
    previous_node = working_node.previous_node

    working_node.next_node = previous_node
    list.head = working_node

    previous_node.previous_node = working_node
    previous_node.next_node = next_node

    next_node.previous_node = previous_node
  end

  def add_new_node_to_head(working_node)
    old_head = list.head
    old_head.previous_node = working_node

    working_node.next_node = old_head
    list.head = working_node
    list.tail = working_node if list.tail.value.nil?

    @cache[working_node.value] = working_node
  end

  def remove_tail
    last_node = list.tail
    new_last = last_node.previous_node

    last_node.previous_node = nil
    new_last.next_node = nil

    list.tail = new_last
    @cache.delete(last_node.value)
  end
end

class Node
  attr_accessor :value, :next_node, :previous_node

  def initialize(value = nil, next_node = nil, previous = nil)
    @value = value
    @next_node = next_node
    @previous_node = previous_node
  end

end

class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = @head
  end

end
