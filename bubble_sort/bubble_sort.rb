def bubble_sort(array)
  n = array.length

  until n <= 1
    new_n = 0
    array[1..n].each_with_index do |number, index|
      j = index + 1
      if array[j - 1] > array[j]
        array[j], array[j - 1] = array[j - 1], array[j]
        new_n = j
      end
    end
    n = new_n
  end
p array
end

bubble_sort([4,3,78,2,0,2])
bubble_sort([4,3,78,4,5,1,3,2,0,2])
bubble_sort([1,4,3,78,0,2,0,2,45,8,854])