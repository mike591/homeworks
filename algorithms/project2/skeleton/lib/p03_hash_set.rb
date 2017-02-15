require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      resize! if @count == num_buckets
      hash = key.hash
      bucket = @store[hash % num_buckets]
      bucket << key
      @count += 1
    end
  end

  def include?(key)
    hash = key.hash
    bucket = @store[hash % num_buckets]
    bucket.include?(key)
  end

  def remove(key)
    if include?(key)
      hash = key.hash
      bucket = @store[hash % num_buckets]
      bucket.delete(key)
      @count -= 1
    end
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
