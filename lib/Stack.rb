class Stack
  def initialize
    @store = Array.new
  end

  def push(element)
    @store << element
  end

  def pop
    removed = @store[-1]
    @store.delete_at(-1)
    return removed

  end

  def top
    return @store[-1]

  end

  def size
    return @store.length
  end

  def empty?
    if @store.length == 0
      empty = true
    else
      empty = false
      return empty
    end
  end

  def to_s
    return @store.to_s
  end
end
