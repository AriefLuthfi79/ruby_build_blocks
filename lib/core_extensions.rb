module Enumerable
  def my_each
    val = 0
    if self.instance_of? Array
      while val < size
        yield(self[val])
        val += 1
      end
      self
    elsif self.instance_of? Range
      for i in self
        yield(i)
      end
    end
  end

  def my_each_with_index
    val = 0
    while val < size
      yield(self[val], val)
      val += 1 
    end
    self
  end

  def my_each_with_lambda(&block)
    block ||= lambda { |el| el }
    val = 0
    while val < size
      block.call(self[val])
      val += 1
    end
  end

  def my_select
    new_arr = []
    if self.instance_of? Array
      self.my_each { |el| new_arr << yield(el) }
      return new_arr
    elsif self.instance_of? Range
      self.my_each { |el| new_arr << yield(el) }
    end
  end

  def my_all?
    result = true 
    if block_given?
      self.my_each do |item| 
        result = result && yield(item)
      end
    else
      self.my_each { |item| result = result && (item ? true : false) }
    end
    result
  end

  def my_any?
    result = false
    if block_given?
      self.my_each { |element| result = true if yield element }
    else
      self.my_each do |element|
        if element.nil? || element.eql?(false)
          result = false
        else
          result = true
        end
      end
    end
    result
  end

  def my_none?
    result = false
    if block_given?
      if self.empty?
        result ||=  yield(el)
      else
        self.my_each { |el| result = true if yield(el) }
      end
    end
    result
  end

  def my_count
    count = 0
    if block_given?
      self.my_each_with_index { |val, index| count += 1 if yield(val) }
    else
      self.my_each_with_index { |val, index| count += 1 }
    end
    count
  end

  def my_map(proc = nil)
    new_arr = []
    if self.instance_of? Array
      self.my_each { |val| new_arr << yield(val) }
      return new_arr
    elsif proc
      self.my_each { |el| new_arr << proc.call(el) }
    elsif self.instance_of? Range
      for i in self
        new_arr << i
      end
      yield(new_arr)
    end
  end

  def my_inject(item = 0)
    result = item
    self.my_each do |x|
      result = yield(result, x)
    end
    result
  end
end

# arr = ["a", 1, true, nil]

# arr.my_each { |val| puts "#{val.inspect}" }
# arr.my_each_with_lambda { |val| puts "#{val}" }
# arr.my_each_with_index { |val, index| puts "#{index}" }
# (1..10).my_select { |val| puts val.inspect }

# puts [1,2,3,4,5,6, nil].my_all?
# puts [nil, nil, false].my_any?
# arr = [nil, 1, "hello"]
# puts arr.my_any? { |val| arr.length > 1 }
# puts [nil,true,false].my_none? { |val| puts val }
my_proc = Proc.new { |el| el }
puts [2,3,4,2,3].my_map(&my_proc).inspect
# puts [1,2,3,4,5].my_inject { |val,val2| val }
