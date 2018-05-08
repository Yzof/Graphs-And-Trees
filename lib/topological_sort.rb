require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms
=begin
  Notes:
  - Other algorithms of note: Coffman-Graham and a modification to Depth
    first search
  -Khans Algortithm:
    Brief Overview:
    - This is not a deterministic
    - You want to select a vertex that has no in-edges
    - Then you want to remove all out edges(as though that 'tast' was complete)
    - Add that vertex to the first layer
    - Now check which vertices have no in-edges, these will make up layer 2
    - This process will eventually create dependency layers, with each layer
      requiring the previous layer, each vertex in a given layer can be
      completed in any order
    Steps:
      1. Queue up any vertex that has no in-edges
      2. Pop off a vertex from the queue
        2.a Remove vertex from the graph(remove it's out edges)
        2.b Push vertex in a results array(will be the sorted version)
        2.c Examine destination vertices and add those to the queue if
            it has no more in-edges
  -
=end
def topological_sort(vertices)
  # This implementation has O(|V| + |E|)
  # In a sparse graph, with few edges, this approaches just O(|V|) or linear
  # In a dense graph, with many edges, this approaches O(|V|^2) or quadratic
  sorted = []
  top = []

  vertices.each do |vertex|
    if vertex.in_edges.empty?
      top << vertex
    end
  end

  until top.empty?
    current = top.shift
    sorted << current

    until current.out_edges.empty
      edge = current.out_edges.pop
      top << edge.to_vertex if edge.to_vertex.in_edges.length == 1
      edge.destroy!
    end
    # current.out_edges.each do |edge|
    #   if edge.to_vertex.in_edges.length == 1
    #     top << edge.to_vertex
    #   end
    #
    #   edge.destroy!
    # end
  end

  return [] if sorted.length != vertices.length

  sorted
end
