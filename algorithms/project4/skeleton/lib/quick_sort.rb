require 'byebug'

class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array[0]
    left = []
    right = []
    current = 1
    until current == array.length
      array[current] <= pivot ? left << array[current] : right << array[current]
      current += 1
    end
    return sort1(left) + [pivot] + sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if length < 2

    pivot_idx = partition(array, start, length, &prc)

    left_length = pivot_idx - start
    right_length = length - (left_length + 1)
    sort2!(array, start, left_length, &prc)
    sort2!(array, pivot_idx + 1, right_length, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    pivot = array[start]
    index = start
    current = start + 1

    until current == (start + length)
      if prc.call(array[current], pivot) <= 0
        array[current], array[index + 1] = array[index + 1], array[current]
        index += 1
      end
      current += 1
    end

    array[start], array[index] = array[index], array[start]
    return index
  end
end
