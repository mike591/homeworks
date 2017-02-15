class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if !@root
      @root = BSTNode.new(value)
      return
    end

    BinarySearchTree.insert!(@root, value)
  end

  def find(value)
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) if node.nil?

    if value <= node.value
      node.left = self.insert!(node.left, value)
      return node
    else # value > node.value
      node.right = self.insert!(node.right, value)
      return node
    end
  end

  def self.find!(node, value)
    return nil if node.nil?
    return node if node.value == value

    if value <= node.value
      return self.find!(node.left, value)
    else
      return self.find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [] if node.nil?
    arr = []
    arr << node.value
    arr += preorder!(node.left)
    arr += preorder!(node.right)

    arr
  end

  def self.inorder!(node)
    return [] if node.nil?
    arr = []
    arr += inorder!(node.left)
    arr << node.value
    arr += inorder!(node.right)

    arr
  end

  def self.postorder!(node)
    return [] if node.nil?
    arr = []
    arr += postorder!(node.left)
    arr += postorder!(node.right)
    arr << node.value

    arr
  end

  def self.height!(node)
    return -1 if node.nil?
    left = 1 + self.height!(node.left)
    right = 1 + self.height!(node.right)
    left >= right ? left : right
  end

  def self.max(node)
    return node if node.nil?
    until node.right.nil?
      node = node.right
    end
    return node
  end

  def self.min(node)
    return node if node.nil?
    until node.left.nil?
      node = node.left
    end
    return node
  end

  def self.delete_min!(node)
    return nil if node.nil?
    if node.left.nil?
      node = node.right
      return node
    end

    current = node

    until current.left.left.nil?
      current = current.left
    end

    current.left = current.left.right
  end

  def self.delete!(node, value)
    return nil unless node

    if value < node.value
      node.left = self.delete!(node.left, value)
    elsif value > node.value
      node.right = self.delete!(node.right, value)
    else
      return node.left unless node.right
      return node.right unless node.left
      t = node
      node = t.right.min
      node.right = self.delete_min!(t.right)
      node.left = t.left
    end

    node
  end
end
