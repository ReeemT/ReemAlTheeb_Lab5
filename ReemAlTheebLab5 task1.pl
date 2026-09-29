male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).


parent(abraham,herb).
parent(abraham,homer).
parent(mona,homer).
parent(clancy,marge).
parent(clancy,patty).
parent(clancy,selma).
parent(jackie,marge).
parent(jackie,patty).
parent(jackie,selma).
parent(homer,bart).
parent(homer,lisa).
parent(homer,maggie).
parent(marge,bart).
parent(marge,lisa).
parent(marge,maggie).
parent(selma,ling).


father(X,Y) :- parent(X,Y), male(X).
mother(X,Y) :- parent(X,Y), female(X). 

son(X,Y) :- parent(Y,X), male(X). 
daughter(X,Y) :- parent(Y,X), female(X). 

brother(X,Y) :- parent(P,X), parent(P,Y), X\=Y, male(X).
sister(X,Y)  :- parent(P,X), parent(P,Y), X\=Y, female(X).

grandfather(X,Z) :- parent(X,Y), parent(Y,Z), male(X).

aunt(X,Y) :- parent(P,Y), parent(G,P), parent(G,X), X\=P, female(X).
uncle(X,Y) :- parent(P,Y), parent(G,P), parent(G,X), X\=P, male(X).

cousin(X,Y) :- parent(P1,X), parent(P2,Y), parent(G,P1), parent(G,P2),P1\=P2.

ancestor(X,Z) :- parent(X,Z).
ancestor(X,Z) :- parent(X,Y), ancestor(Y,Z).





91 ?- father(homer,X).
X = bart ;
X = lisa ;
X = maggie.

92 ?- father(X,bart).
X = homer ;
false.

93 ?- mother(marge,X).
X = bart ;
X = lisa ;
X = maggie.

94 ?- mother(X,ling).
X = selma.

95 ?- son(X,homer).
X = bart ;
false.

96 ?- son(bart,X).
X = homer ;
X = marge.

97 ?- daughter(X,marge).
X = lisa ;
X = maggie.

98 ?- daughter(ling,X).
X = selma.


99 ?- brother(bart,X).
X = lisa ;
X = maggie ;
X = lisa ;
X = maggie.

100 ?- brother(X,homer).
X = herb ;
false.

101 ?- sister(X,bart).
X = lisa ;
X = maggie ;
X = lisa ;
X = maggie ;
false.


102 ?- sister(patty,X).
X = marge ;
X = selma ;
X = marge ;
X = selma.

103 ?- grandfather(X,bart).
X = abraham ;
X = clancy ;
false.

104 ?- grandfather(abraham,X).
X = bart ;
X = lisa ;
X = maggie.

105 ?- aunt(X,bart).
X = patty ;
X = selma ;
X = patty ;
X = selma.


106 ?- aunt(X,ling).
X = marge ;
X = patty ;
X = marge ;
X = patty ;
false.

107 ?- uncle(herb,X).
X = bart ;
X = lisa ;
X = maggie ;
false.

108 ?- uncle(X,ling).
false.

109 ?- cousin(bart,X).
X = ling ;
X = ling.


110 ?- cousin(ling,X).
X = bart ;
X = bart ;
X = lisa ;
X = lisa ;
X = maggie ;
X = maggie ;
false.

111 ?- ancestor(abraham,X).
X = herb ;
X = homer ;
X = bart ;
X = lisa ;
X = maggie ;
false.


112 ?- ancestor(X,ling).
X = selma ;
X = clancy ;
X = jackie ;
false.



