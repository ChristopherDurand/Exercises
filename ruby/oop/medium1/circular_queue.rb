class CircularQueue
  def initialize(s)
    @data = Array.new(s, nil)
    @size = s
    @spot = 0
    @oldest = 0
  end

  def enqueue(datum)
    data[spot] = datum
    if spot == oldest && full?
      self.oldest = (oldest + 1) % size 
    end
    self.spot = (spot + 1) % size
  end

  def dequeue
    temp = data[oldest]
    if temp
      data[oldest] = nil
      self.oldest = (oldest + 1) % size
    end
    temp
  end

  def to_s
    "Spot 0: #{data[0]}\n" +
    "Spot 1: #{data[1]}\n" +
    "Spot 2: #{data[2]}\n" + 
    "Oldest: #{oldest}\n" +
    "spot:   #{spot}\n\n"
  end
  private

  def full?
    data.none? {|spot| spot == nil}
  end

  attr_accessor :data, :spot, :size, :oldest
end

class CircularQueue2
  def initialize(s)
    @data = []
    @size = s
  end

  def enqueue(datum)
    data.push(datum)
    data.shift if data.size > size
  end

  def dequeue
    data.shift
  end
  
  private

  attr_accessor :data, :size
end



queue = CircularQueue2.new(3)
puts queue.dequeue == nil
puts queue
queue.enqueue(1)

puts queue
queue.enqueue(2)
puts queue
puts queue.dequeue == 1

puts queue
queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil