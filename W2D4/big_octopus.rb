
def sluggish(array)
# Find the longest fish in O(n^2) time. Do this by comparing all
# fish lengths to all other fish lengths

  array.each do |first|
    largest_fish = true
    array.each do |other_fish|
        largest_fish = false if other_fish.length > first.length
    end
    return first if largest_fish
  end
end


def dominant(arr)
# Find the longest fish in O(n log n) time. Hint: You saw a sorting
# algorithm that runs in O(n log n) in the Sorting Demo. Remember
# that Big O is classified by the dominant term
 prc = Proc.new { |x, y| y.length <=> x.length}
 arr.merge_sort(&prc)[0]

end

class Array
  #this should look familiar
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end


def clever(array)
# Find the longest fish in O(n) time. The octopus can hold on to the
# longest fish that you have found so far while stepping through the
# array only once.
  largest = array.first
  array.each do |el|
    largest = el if el.length > largest.length
  end
  return largest

end

=begin
fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
 => "fiiiissshhhhhh"
=end





def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |dir, idx|
    return idx if dir == direction
  end
  nil
end


def constant_dance(direction, tiles_hash)
  return tiles_hash[direction]
end


=begin
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = { :up => 0, :right_up=> 1, :right=> 2, :right_down=> 3, :down=> 4, :left_down=> 5, :left=> 6, :left_up=> 7}
=end
