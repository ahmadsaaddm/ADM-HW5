#!/bin/bash

echo

# Calculate betweenness centrality for each node
python -c "import networkx as nx; citation_subgraph = nx.read_edgelist('citation_subgraph.edgelist', create_using=nx.DiGraph()); print('\n'.join([f'{node} {centrality}' for node, centrality in nx.betweenness_centrality(citation_subgraph).items()]))" > betweenness_centrality.txt

# Sort nodes by betweenness centrality in descending order
sort -k2 -rn betweenness_centrality.txt > sorted_betweenness_centrality.txt

echo "-------------------------------------" 
echo "Betweenness centrality for each node:"
echo "-------------------------------------"

# Print the top connectors
head -n 10 sorted_betweenness_centrality.txt

echo
echo "---------------------------------------" 
echo "In-degree and out-degree for each node:"
echo "---------------------------------------"

# Calculate in-degree and out-degree for each node and print the largest and smallest value for each type of degree
python -c "import networkx as nx; citation_subgraph = nx.read_edgelist('citation_subgraph.edgelist', create_using=nx.DiGraph()); in_degrees = sorted(citation_subgraph.in_degree(), key=lambda x: x[1], reverse=True); out_degrees = sorted(citation_subgraph.out_degree(), key=lambda x: x[1], reverse=True); print(f'Largest In-Degree: {in_degrees[0][0]} {in_degrees[0][1]}'); print(f'Lowest In-Degree: {in_degrees[-1][0]} {in_degrees[-1][1]}'); print(f'Largest Out-Degree: {out_degrees[0][0]} {out_degrees[0][1]}'); print(f'Lowest Out-Degree: {out_degrees[-1][0]} {out_degrees[-1][1]}')"

echo
echo "------------------------------------------------" 
echo "Average length of the shortest path among nodes:"
echo "------------------------------------------------"

# Calculate average length of the shortest path among nodes
python -c "import networkx as nx; citation_subgraph = nx.read_edgelist('citation_subgraph.edgelist', create_using=nx.DiGraph()); average_shortest_path = nx.average_shortest_path_length(citation_subgraph); print(f'Average Shortest Path Length: {average_shortest_path}')"

echo
