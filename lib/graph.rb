=begin
Terms:
  Vertices, Edges, Weights, Direction, Associations, Sparcity/Density
Notes:
  - Vertices(dots) are usually the data we are trying to represent with this
  data structure
  - Edges(lines) connect the vertices, and represent the relationship
    - Edges can optionally be assigned weights and direction
  - Direction is used when we want to add importance to a specific
  relationship in our graph. Eg A -> C vs A -- C
  - If you have a 'Directed Graph', all edges in that graph must have
  a direction.
  - The same principle applies with weights, which are just a numerical
  value associated with a direction
  - |V| means the number of vertices
  - |E| means the number of edges
  - The number of connections between nodes is known as the Density
    - The following formula is used to calculate the density in an undirected graph:
      |E| / (|V| * (|V| - 1))
  - The Max density of an undirected graph is 1, for a directed graph it is 2
      - This is because the directed graph has double the number of possible
      connections for a single node (both out and in)
  - A graphs density isn't necessarily conistent, there may be dense patches
  - Q. Why is density important?
    - A. An algorithm that encounters a very dense graph can slow down
        immensely, but a sparse graph can keep the speed closer to
        linear time.
  - A Tree is one type of graph. Eg. Binary Search Tree
  - Tree's have a consistent density of 1 / n
    - This is due to the fact that we are using the above formula for
      calculating density. for any number of nodes(vertices) n there are
      (n - 1) edges and n(n - 1) vertices. (n - 1) / n(n - 1) == 1 / n
  - Q. What defines a tree?
    - A. n vertices and n - 1 edges. They are also connected graphs.
  - Q. What are the main graph types?
    - A. ~~~~~~ANSWER HERE ~~~~~~~~~~~~
  - Cycle: When you can traverse from one node, along the edges, and end
    up at the original node.
  - Dependency Set:
    - Vertices: A Task
    - Edges: Any two nodes are connected(dependent) if and only if one
      of the nodes must be completed before the other node can
    - A cycle in a Dependency Set is fatal
  - Adjacency Matrix:
    - A Two-Dimensional, with two optional sets of data:
      - For a non-directional graph the values are either 1 for to represent
        an edge or 0 for no edge.
        EX.
           A, B, C, D
        A [0, 1, 0, 1]
        B [1, 0, 1, 0]
        C [0, 1, 0, 0]
        D [1, 0, 0, 0]
      - For a directed graph the values are 0 for no edge, 1 for an edge
        from the node, and -1 as an edge towards the node.
        EX. From A -> B, C -> B,
            A, B, C, D    | -> To
        A [ 0, 1, 0, 1]   V
        B [-1, 0,-1, 0]   From
        C [ 0, 1, 0, 0]
        D [-1, 0, 0, 0]
Major Example:
  Document Object Model as an example of a tree
  The Vertices are the DOM Elements
  The Edges are the parent/child relationship
=end

class Vertex
  attr_accessor :value, :in_edges, :out_edges
  def initialize(value)
    @value = value
    @in_edges = []
    @out_edges = []
  end
end

class Edge
  attr_accessor :from_vertex, :to_vertex, :cost
  def initialize(from_vertex, to_vertex, cost = 1)
    # Another way to store vertices:
    # @vertices = [from_vertex, to_vertex]
    @from_vertex = from_vertex
    @to_vertex = to_vertex
    # If every edge is weighted 1(or any constant value), it is unweighted
    @cost = cost

    @from_vertex.out_edges.push(self)
    @to_vertex.in_edges.push(self)
  end

  def destroy!

  end
end

class Graph
  def initialize
    @vertices = []
    # This is only for an undirected edges
    @edges = []
  end
end
