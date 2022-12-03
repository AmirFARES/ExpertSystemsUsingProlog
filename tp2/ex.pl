% qst 1 ----------------------------------------------------------

pere(amine,mohamed).
pere(mohamed,farouk).
pere(mohamed,djamel).
pere(farouk,hadjer).
pere(brahim,sara).
pere(brahim,samir).
pere(samir,safia).
pere(samir,aya).
pere(salah,mahdi).
mere(fairouz,mohamed).
mere(amel,sara).
mere(amel,samir).
mere(sara,farouk).
mere(sara,djamel).
mere(amina,safia).
mere(amina,aya).
mere(meriem,hadjer).
mere(safia,mahdi).

homme(amine).
homme(mohamed).
homme(farouk).
homme(djamel).
homme(brahim).
homme(samir).
homme(salah).
homme(mahdi).

femme(hadjer).
femme(sara).
femme(safia).
femme(aya).
femme(fairouz).
femme(amel).
femme(amina).
femme(meriem).

% qst 2 ----------------------------------------------------------

parent(X,Y):-pere(X,Y);mere(X,Y).
fils(X,Y):-homme(X),(pere(Y,X);mere(Y,X)).
fille(X,Y):-femme(X),(pere(Y,X);mere(Y,X)).
femme(X,Y):-mere(X,Z),pere(Y,Z).
mari(X,Y):-pere(X,Z),mere(Y,Z).
frere(X,Y):-homme(X),pere(P,X),pere(P,Y),mere(M,X),mere(M,Y),X\==Y.
soeur(X,Y):-femme(X),pere(P,X),pere(P,Y),mere(M,X),mere(M,Y),X\==Y.
gendre(X,Y):-mari(X,Z),fille(Z,Y).
frereSoeur(X,Y):-frere(X,Y);soeur(X,Y).
grandPere(X,Y):-pere(X,Z),(pere(Z,Y);mere(Z,Y)).
grandMere(X,Y):-mere(X,Z),(pere(Z,Y);mere(Z,Y)).
grandParent(X,Y):-grandPere(X,Y);grandMere(X,Y).
oncle(X,Y):-frere(X,Z),parent(Z,Y).
tante(X,Y):-soeur(X,Z),parent(Z,Y).
cousin(X,Y):-fils(X,Z),(oncle(Z,Y);tante(Z,Y)),X\==Y.
cousine(X,Y):-fille(X,Z),(oncle(Z,Y);tante(Z,Y)),X\==Y.
arriereGdPere(X,Y):-pere(X,Z),grandParent(Z,Y).
arriereGdMere(X,Y):-mere(X,Z),grandParent(Z,Y).


% qst 4 ----------------------------------------------------------

neveu(X,Y):-fils(X,Z),frereSoeur(Z,Y). % neveu (nephew) : fils de frere ou soeur
niece(X,Y):-fille(X,Z),frereSoeur(Z,Y). % niece : fille de frere ou soeur
beauPere(X,Y):-pere(X,Z),(mari(Z,Y);femme(Z,Y)). % Le beau-père (father-in-law) : le père de son mari ou de sa femme.
belleMere(X,Y):-mere(X,Z),(mari(Z,Y);femme(Z,Y)). % La belle-mère (mother-in-law) : la mère de son mari ou de sa femme.