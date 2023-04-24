class Graph
  def initialize(file_path)
    @nodes = Hash.new { |h, k| h[k] = {} }
    File.open(file_path).each_line do |line|
      line.chomp!
      next if line.empty? # skip empty lines
      parts = line.split("")
      from = parts[0]
      to = parts[1]
      distance = parts[2..-1].join("").to_i
      add_edge(from, to, distance)
    end
  end
  
  def add_edge(from, to, distance)
    @nodes[from][to] = distance
  end
  
  def get_distance(route)
    distance = 0
    for i in 0..route.length-2
      from = route[i]
      to = route[i+1]
      if @nodes[from].key?(to)
        distance += @nodes[from][to]
      else
        return "NO SUCH ROAD"
      end
    end
    return distance
  end

  def count_trips_with_max_stops(start, finish, max_stops)
    count = 0
    dfs = lambda do |node, stops|
      if node == finish && stops <= max_stops
        count += 1
      end
      if stops < max_stops
        @nodes[node].keys.each do |neighbor|
          # Check if the neighbor has already been visited in this path
          if stops == max_stops - 1 && neighbor == finish
            next
          end
          dfs.call(neighbor, stops+1)
        end
      end
    end
    dfs.call(start, 0)
    return count
  end

  def count_trips_with_exact_stops(start, finish, exact_stops)
    count = 0
    dfs = lambda do |node, stops|
      if node == finish && stops == exact_stops
        count += 1
      end
      if stops < exact_stops
        @nodes[node].keys.each do |neighbor|
          dfs.call(neighbor, stops+1)
        end
      end
    end
    dfs.call(start, 0)
    return count
  end

  def shortest_distance(start, finish)
    distances = {}
    @nodes.keys.each do |node|
      distances[node] = Float::INFINITY
    end
    distances[start] = 0
    queue = [start]
    visited = {}
    while queue.length > 0
      node = queue.shift
      visited[node] = true
      @nodes[node].keys.each do |neighbor|
        new_distance = distances[node] + @nodes[node][neighbor]
        if new_distance < distances[neighbor]
          distances[neighbor] = new_distance
          unless visited[neighbor]
            queue << neighbor
          end
        end
      end
    end
    return distances[finish]
  end

  def count_paths_within_distance(start, finish, max_distance)
    count = 0
    dfs = lambda do |node, distance|
      if distance < max_distance
        if node == finish && distance > 0
          count += 1
        end
        @nodes[node].each do |neighbor, edge_distance|
          dfs.call(neighbor, distance + edge_distance)
        end
      end
    end
    dfs.call(start, 0)
    return count
  end
end

def create_and_run_graph(file_path)
  graph = Graph.new('input.txt')

  puts graph.get_distance(["A", "B", "C"]) 

  puts graph.get_distance(["A", "D"]) 

  puts graph.get_distance(["A", "D", "C"]) 

  puts graph.get_distance(["A", "E", "B", "C", "D"]) 

  puts graph.get_distance(["A", "E", "D"]) 

  puts graph.count_trips_with_max_stops("C", "C", 3) 

  puts graph.count_trips_with_exact_stops("A", "C", 4) 

  puts graph.shortest_distance("A", "C") 

  puts graph.shortest_distance("B", "B") 

  puts graph.count_paths_within_distance("C", "C", 30) 
end

puts "Example file_path for the program is input.txt "
puts "Please enter the path to the file: "
file_path = gets.chomp

if File.exist?(file_path)
  create_and_run_graph(file_path)
else
  puts "The file does not exist."
end
