=begin
  while loop over the array
  using each swap right left
  do the while according to array length to switch all

  sorted = true => if sorted, no need to check whole array => better time
=end

dummy_ar = [4,3,78,2,0,2]

def bubble_sort(array)
    (array.length - 1).times do 
        sorted = true

        array.each_with_index do | _, index |
            break if index == array.length - 1

            current_number = array[index]
            next_number = array[index + 1]
            if current_number > next_number
                array[index] = next_number
                array[index + 1] = current_number
                sorted = false
            end
        end

        break if sorted
    end

    array
end

puts bubble_sort(dummy_ar)