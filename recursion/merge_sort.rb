def merge_sort(array)
  # base case
  return array if array.length < 2
  
  middle = array.length / 2
  # sort left
  left_half = merge_sort(array[0...middle])
  #sort right
  right_half = merge_sort(array[middle..-1])

  # merge two halves
  sorted = []
  # compare until one half is empty
  until left_half.empty? || right_half.empty?
    # one pointer in each half comparing their current values
    # smaller values pushed to the sorted array
    left_half.first <= right_half.first ? sorted << left_half.shift : sorted << right_half.shift
  end

  sorted + left_half + right_half
end

p merge_sort([3, 1, 4, 5, 6])