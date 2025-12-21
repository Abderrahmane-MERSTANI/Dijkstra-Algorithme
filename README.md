# Dijkstra’s Shortest Path Algorithm

This project presents a **general implementation of Dijkstra’s algorithm**, a classic algorithm used to compute the **shortest paths from a single source vertex** to all other vertices in a **weighted graph with non-negative edge weights**.

The project is intended for **educational and learning purposes** and can be adapted to **any programming language**.

---

## 📌 Key Concepts

- Single-source shortest path problem
- Weighted graphs
- Greedy algorithm
- Graph traversal and relaxation

---

## 🧠 Algorithm Description

Dijkstra’s algorithm solves the shortest path problem by repeatedly:

1. Initializing the distance to all vertices as infinite, except the source
2. Selecting the unvisited vertex with the smallest known distance
3. Relaxing all edges from this vertex
4. Marking the vertex as visited
5. Repeating until all vertices are processed or unreachable

Once a vertex is marked as visited, its shortest distance is guaranteed.

⚠️ **Constraint:**  
The algorithm works **only with non-negative edge weights**.

---

## 🗺 Graph Representation

The algorithm can be implemented using different graph representations:

- Adjacency matrix
- Adjacency list
- Edge list

Each edge must be associated with a **positive weight**.

---

## 📤 Output

For a given source vertex, the algorithm produces:

- The shortest distance to every other vertex
- Optionally, the shortest path itself (via parent or predecessor tracking)

---

## ⏱ Complexity

The complexity depends on the data structures used:

| Data Structure | Time Complexity |
|----------------|----------------|
| Adjacency Matrix | O(V²) |
| Adjacency List + Min-Heap | O((V + E) log V) |

Where:
- `V` = number of vertices
- `E` = number of edges

---

## 🛠 Customization

You can adapt the algorithm to:
- Directed or undirected graphs
- Small or large graphs
- Path reconstruction or distance-only output
- Static or dynamic input (file, user input, API, etc.)

---

## ❌ Limitations

- Does **not support negative edge weights**
- Does **not detect negative cycles**
- Not suitable for graphs where edge weights can change dynamically

For such cases, consider alternative algorithms (e.g., Bellman-Ford).

---

## 📚 References

- Dijkstra, E. W. (1959). *A Note on Two Problems in Connexion with Graphs*
- Cormen, Leiserson, Rivest, Stein. *Introduction to Algorithms*

---

## ✅ License

This project is provided for **educational purposes**.  
You are free to use, modify, and adapt it in any programming language.

---

## 🚀 Usage

This README can be used as documentation for implementations in:
- C / C++
- Java
- Python
- JavaScript
- Any other programming language

---

If you want, I can also:
✔ add **pseudo-code**  
✔ write a **theoretical explanation for exams**  
✔ adapt it to **academic report style**

Just tell me 😊
