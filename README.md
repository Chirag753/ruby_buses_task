# prerequisites
Ruby installed

# Install rspec gem
gem install rspec

# How to Run the program
ruby graph.rb

# How to Run test cases
rspec graph_spec.rb

# Program Description
This is a Ruby program that defines a Graph class and provides methods to perform operations on a graph read from a file specified by the user.

Overview of the program:

The program is designed to work with a file containing information about a graph, where each line in the file represents an edge between two nodes, along with the weight of the edge. The program uses the Graph class to add nodes and edges to the graph by reading each line from the file and calling the add_node and add_edge methods. The Graph class has several methods that perform various operations on the graph.

The get_distance method takes an array of nodes and returns the distance of the path represented by those nodes. If the path is not valid, the method returns the string "NO SUCH ROAD". The count_trips_with_max_stops and count_trips_with_exact_stops methods take a starting node, ending node, and a specified number of stops and return the number of paths that meet the criteria. The shortest_distance method takes a starting node and ending node and returns the length of the shortest path between those nodes. Finally, the count_paths_within_distance method takes a starting node, ending node, and maximum distance and returns the number of paths that meet the criteria.

The program assumes that the file containing the graph data is in the correct format and contains valid input data. Additionally, the program prompts the user to enter the file path and checks if the file exists before creating a Graph object and performing the desired operations on the graph.# ruby_buses_task
