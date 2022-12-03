etudiant(mohamed,38).
etudiant(amina,37).
toussent(mohamed).
toussent(amina).

grippe(X):-toussent(X),fievre(X).
fievre(X):-etudiant(X,T),T>=38.
conge(X):-grippe(X).
