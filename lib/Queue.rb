class Queue
  def initialize
    @store = Array.new
  end

  def enqueue(element)
    @store.push(element)
    return @store
  end

  def dequeue
    removed = @store[0]
    @store.delete_at(0)
    return removed
  end

  def front
    return @store[0]
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
