require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# def topological_sort(vertices)
#   sorted = []
#   top = []
#   vertices.each do |vertex|
#     if vertex.in_edges.length == 0
#       top << vertex
#     end
#   end
#
#   until top.length == 0
#     current = top.shift
#     sorted << current
#     current.out_edges.each do |edge|
#       if edge.to_vertex.in_edges.length == 1
#         top << edge.to_vertex
#         edge.destroy!
#       end
#     end
#   end
#   sorted
# end

# Tarjans

def topological_sort(vertices)
  ordering = []
  explored = Set.new

  vertices.each do |vertex| # O(|v|)
    dfs!(vertex, explored, ordering) unless explored.include?(vertex)
  end

  ordering
end

def dfs!(vertex, explored, ordering)
  explored.add(vertex)

  vertex.out_edges.each do |edge| # O(|e|)
    new_vertex = edge.to_vertex
    dfs!(new_vertex, explored, ordering) unless explored.include?(new_vertex)
  end

  ordering.unshift(vertex)
end
