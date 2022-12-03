route(v,g).
route(v,z).
route(g,y).
route(g,z).
route(y,r).
route(y,t).
route(z,v).

voisines(X,Y):-route(X,Y),route(Y,X).
chemin(X,Z):-route(X,Y),route(Y,Z).