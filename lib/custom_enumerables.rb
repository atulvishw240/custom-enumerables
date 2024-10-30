module Enumerable
  # Your code goes here
  def my_each_with_index
    max = self.length - 1
    for i in 0..max do
      yield(self[i], i)
    end

    self
  end

  def my_select
    arr = [] # Return this after populating it with values, for which the condition evaluates to true
    for item in self
      if yield(item)
        arr << item
      end
    end

    arr
  end

  def my_all?
    for item in self
      unless yield(item)
        return false
      end
    end

    true
  end

  def my_any?
    for item in self
      return true if yield(item)
    end
  
    false
  end

  def my_none?
    for item in self
      return false if yield(item)
    end

    true
  end

  def my_count
    unless block_given?
      return self.length
    end

    count = 0
    for item in self
      count += 1 if yield(item)
    end
    
    return count
  end

  def my_map
    arr = []
    for item in self
      arr << yield(item)
    end

    arr
  end

  def my_inject(initial_value)
    accumulator = initial_value
    for item in self
      accumulator = yield(accumulator, item)
    end

    return accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield(item)
    end
  end
end
