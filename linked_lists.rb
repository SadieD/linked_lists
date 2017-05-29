module LinkedList

class LinkedList
  attr_reader :size, :head, :tail
  
  def initialize(head=nil)
    @head = head
    @size = 0
  end
  
  def append(data)
    temp = Node.new(data)
    size > 0 ? at(size-1).next_node = temp : @head = temp
    @size += 1
    to_s
  end
  
  def prepend(data)
    @size += 1
    temp = Node.new(data, @head)
    @head = temp
    to_s
  end
  
  def insert_at(index, data)
    if index > 0 and index < size
      temp = Node.new(data, at(index))
      at(index - 1).next_node = temp if index > 0
      @size += 1
    elsif index == 0
      prepend(data)
    end
    to_s
  end
  
  def remove_at(index)
    if index > 0 and index < size
      at(index - 1).next_node = at(index + 1)
      @size -= 1
    elsif index == 0
      size > 1 ? @head = at(index + 1) : @head = nil
      @size -= 1
    end
    to_s
  end
  
  def at(index)
    node = @head
    index.times { |x| node = node.next_node } if size > 1 and index > 0
    node
  end
  
  def contains?(data)
    (size).times { |x| return true if at(x).value == data }
    return false
  end
  
  def find(data)
    (size).times { |x| return x if at(x).value == data }
    return nil
  end
  
  def to_s
    contents = 'nil'
    (size-1).downto(0) { |x| contents.prepend("( #{at(x).value} ) -> ")}
    contents
  end
  
end

class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

end
