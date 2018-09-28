param n;
param m;

set NODOS := 1..n;
set ARCOS := 1..m;

param b{NODOS};
param costes{ARCOS} >= 0;
param matriz{NODOS,ARCOS};

var X{ARCOS} binary;

minimize coste_total: sum{j in ARCOS} X[j] * costes[j];

subject to balance {i in NODOS}:
    sum{j in ARCOS} matriz[i,j] * X[j]  = b[i];

