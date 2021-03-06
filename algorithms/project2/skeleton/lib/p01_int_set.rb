class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    if !include?(num)
      @store[num] = true
      return true
    else
      return false
    end
  end

  def remove(num)
    validate!(num)
    if include?(num)
      @store[num] = false
    else
      return false
    end
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    return false unless num.is_a? Integer
    return false if num >= @store.length
    return false if num < 0
    return true
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num unless include?(num)
  end

  def remove(num)
    if include?(num)
      bucket = @store[num % num_buckets]
      bucket.delete(num)
    end
  end

  def include?(num)
    bucket = @store[num % num_buckets]
    bucket.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets
    @store[num % num_buckets] << num unless include?(num)
    @count += 1
  end

  def remove(num)
    if include?(num)
      bucket = @store[num % num_buckets]
      bucket.delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket = @store[num % num_buckets]
    bucket.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |num| insert(num) }
  end
end
