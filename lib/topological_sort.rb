require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms
=begin
  Notes:
  -Khans Algortithm:
    Brief Overview:
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

end
