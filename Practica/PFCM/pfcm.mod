param n; #total nodos
param m; #total arcos

set NODOS := 2..n-1;
set ARCOS := 1..m;


param capacidad{ARCOS};
param matriz{NODOS,ARCOS};
param arcos_entrada{ARCOS};
param arcos_salida{ARCOS};

var v >= 0;
var X{ARCOS} >= 0;

maximize flujo_max: v;

subject to balance {i in NODOS}:
    sum {j in ARCOS} matriz[i,j] * X[j] = 0;

subject to balance_entrada:
    sum {j in ARCOS} X[j] * arcos_entrada[j] = -v; #nodo 6 (emi) nodo 7 (pedro)
    
subject to balance_salida:
    sum {j in ARCOS} X[j] * arcos_salida[j] = v; #nodo 1 (emi) nodo 1 (pedro)

subject to capacidad_maxima {j in ARCOS}: X[j] <= capacidad[j];

