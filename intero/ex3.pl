gros(poule,poussin).
gros(dinde,poule).
gros(autruche,dinde).

pgros(X,Y):-gros(X,Y).

pgros(X,Z):-gros(X,Y),pgros(Y,Z)..