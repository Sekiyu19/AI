# EX_03

## Task
Submit the answer of the exercise within one week. 

Before starting, read the source codes carefully, and try to
understand.  Do not forget (MUST!) to write a report for this exercise
file summary_XX.txt. You may use English or Japanese.

Many comments are included in the `func.c` program.

## Summary of this exercise 今回の問題の概要
- Revise the program made for Ex02, to find a path from a given initial node to a given goal (destination) node, using depth first search and breadth first search. Also, there is a weight for each edge, and the output should contain the total cost of the found path. 

- Ex02を元に、指定した頂点と指定した終点間の経路を幅優先探索と深さ優先探索を行うように変更せよ。また、それぞれの辺に重みを与え、合計コストも計算するようにせよ。

- Refer to pp. 18-24 in the textbook.

## prog_03.c
- Initialize the graph based on data from the keyboard or from a data file
  inputファイルを読み込みグラフを初期化する。(`bool init_garph()`)
- Run depth first search and breadth first search
  読み込んだグラフを用いて、`dfs()`, `bfs()`を実行する。(`dfs()`, `bfs()`は`func.c`で定義されている)

## prog_03.h
Definitions of structures related to the graph.

### vertex_state
```c
enum vertex_state {
    VISITED,   //!< Take this value if the vertex is visited.
    UNVISITED, //!< Take this value if the vertex is unvisited.
};
typedef enum vertex_state VertexState;
```

### edge_state
```c
enum edge_state {
    NOT_CONNECTED = 0, //!< Take this value if the edge does not exist.
    CONNECTED,         //!< Take this value if the edge exists.
};
``` 

### graph
- EX_02 と比べて、edge_costs, vertex_end_search が加わった。

```c
struct graph {
    EdgeState adjacent_matrix[MAX_VERTEX_SIZE][MAX_VERTEX_SIZE]; //!< The adjacent matrix.
    float edge_costs[MAX_VERTEX_SIZE][MAX_VERTEX_SIZE];          //!< The edge costs.
    size_t vertex_count;                                         //!< The number of vertices.
    size_t vertex_starting_search;                               //!< The starting vertex for search.
    size_t vertex_end_search;                                    //!< The end vertex for search.
};
``` 


## func.c
This is the file to revise and complete.

### dfs()
```
1. Initialize all nodes. Set their status to unvisited.
   各ノードの初期化。各ノードをunvisited状態にしておく。
2. Search using `dfs_visit()`. It is necessary to initialize the total cost.
   `dfs_visit()`で探索を行いコストを計算する。今回はコストの初期値が必要になる。
```

### dfs_visit()
Remarks:
1. Open list (stack) is implemented implicitly using recursion.
   open listの処理は再帰を使って(FILO)実装している。
2. The total cost is the reture value.
   今回はcostを返り値として返す。


### bfs()

```
1. Initialize all nodes by setting their status to unvisited.
   各ノードの初期化。各ノードをunvisited状態にしておく。
2. Set the start node, and put it to the open list.
   スタートノードの設定、それをopen listにいれる。
3. Go to 4 if the open list is not empty, stop otherwise.
   open listが空でない場合、4へ。空の場合、終了。
4. Get the current node from the top of the open list, and change its status to visited. 
   open listのトップから現在ノードを取り、その状態をvisitedに変更。
   Find the child nodes of the current node. For each child node, if its status is unvisited,
   find its cost, and put it to the open list. Return to 3.
   現在ノードの子ノードの中で、unvisited状態のものについてそのコストを計算し、open listに入れる。3へ。
```
Here, the open list is implemented using a queue.
open listはqueue(FIFO)で実装してある。

## s_queue.c
Same as Ex_02.

## s_queue.h
Same as Ex_02。

