def swap(arr, index)
  raise IndexError.new("Index #{index} out of bounds") if index >= arr.size || index < 0

  temp = arr[index] # temp value of the array with setup index
  arr[index] = arr[index + 1]
  arr[index + 1] = temp
end

def bubble_sort(arr)
  loop do
    sorted_value = 0

    arr.each_cons(2).each_with_index do |val, index|
      compare = block_given? ? yield(val.first, val.last) : val.first <=> val.last
    
      if compare > 0
        swap(arr, index)
      else
        sorted_value += 1
      end
    end

    return arr if sorted_value >= arr.size - 1
  end
end

puts bubble_sort(["lemari","batu","arie", "kokas"]) { |right, left| right <=> left }