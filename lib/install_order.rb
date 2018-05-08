# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require 'graph'
require 'topological_sort'

def install_order(arr)
  vertices = {}
  max_id = arr.flatten.max
  id_arr = (1..max_id).to_a
  arr.each do |tuple|
    vertices[tuple[0]] = Vertex.new(tuple[0]) unless vertices[tuple[0]]
    vertices[tuple[1]] = Vertex.new(tuple[1]) unless vertices[tuple[1]]
    Edge.new(vertices[tuple[1]], vertices[tuple[0]])
  end
  independent = []
  id_arr.each do |id|
    independent << id if vertices[id] == nil
  end
  independent + topological_sort(vertices.values).map { |vert| vert.value }
end
