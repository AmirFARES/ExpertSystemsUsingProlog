vol(1,annaba,oran,57,764).
vol(2,annaba,costantine,9,120).
vol(3,alger,oran,26,350).
vol(4,alger,costantine,24,321).
vol(5,alger,ouargla,40,540).
vol(6,oran,tlemcen,8,110).
vol(7,ouargla,tlemcen,49,657).
vol(8,ouargla,illizi,40,540).
vol(9,illizi,tamanrasset,39,521).
vol(10,costantine,setif,8,108).
vol(11,alger,setif,16,221).



lien(W1,W2):-vol(_,W1,W2,_,_);vol(_,W2,W1,_,_).
lien(W1,W2):-lien(W1,Z),lien(Z,W2),W1\==Z,Z\==W2,W1\==W2.

temps_voyage(W1,W2,T):-(vol(_,W1,W2,T1,_),T=T1);(vol(_,W2,W1,T2,_),T=T2).
temps_voyage(W1,W2,T):-temps_voyage(W1,Z,T1),temps_voyage(Z,W2,T2),T is T1+T2,W1\==Z,Z\==W2,W1\==W2.

distance_voyage(W1,W2,D):-(vol(_,W1,W2,_,D1),D=D1);(vol(_,W2,W1,_,D2),D=D2).
distance_voyage(W1,W2,D):-distance_voyage(W1,Z,D1),distance_voyage(Z,W2,D2),D is D1+D2,W1\==Z,Z\==W2,W1\==W2.

% t=t1+t2 vs t is t1+t2         is give only value     = give value + vlaue + ...

% trace. after that right lien(X,Y). enter enter enter until affichage after that ; then enter enter ...