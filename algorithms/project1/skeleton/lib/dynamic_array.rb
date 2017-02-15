require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @store = StaticArray.new(8)
    @capacity = 8
  end

  # O(1)
  def [](index)
    check_index(index)
    store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" unless (length > 0)
    val = @store[length - 1]
    @store[length - 1] = nil
    @length -= 1
    val
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if length == capacity
    @length += 1
    @store[length - 1] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if (length == 0)

    val = @store[0]
    (1...length).each { |i| @store[i - 1] = @store[i] }
    @length -= 1

    val
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if length == capacity

    @length += 1
    (length - 2).downto(0).each { |i| @store[i + 1] = @store[i] }
    @store[0] = val

    nil
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    unless (index >= 0) && (index < length)
      raise "index out of bounds"
    end
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)
    @length.times { |i| new_store[i] = @store[i] }

    @capacity = new_capacity
    @store = new_store
  end
end
