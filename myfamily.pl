/* facts */

parent(sumanathilaka, nihal).
parent(sumanathilaka, nandhani).
parent(sumanathilaka, anandha).
parent(sumanathilaka, sriyanandha).
parent(sumanathilaka, kumaranandha).

parent(nikagolla, nihal).
parent(nikagolla, nandhani).
parent(nikagolla, anandha).
parent(nikagolla, sriyanandha).
parent(nikagolla, kumaranandha).

parent(yasapala, suranga).
parent(yasapala, lumbini).

parent(wimala, suranga).
parent(wimala, lumbini).


parent(nihal, sahan).
parent(nihal, nishan).
parent(nihal, sewmini).

parent(indralatha, sahan).
parent(indralatha, nishan).
parent(indralatha, sewmini).

parent(nandhani, buddhi).
parent(nandhani, nanga).
parent(nandhani, rosi).
parent(nandhani, ishan).

parent(sunil, buddhi).
parent(sunil, nanga).
parent(sunil, rosi).
parent(sunil, ishan).

parent(anandha, nilwala).
parent(anandha, kasun).

parent(kamala, nilwala).
parent(kamala, kasun).

parent(buddhi, sasanka).
parent(buddhi, mithila).

parent(ranga, sasanka).
parent(ranga, mithila).

parent(rosi, seshan).
parent(sameera, seshan).

parent(kumaranandha, deshan).
parent(kumaranandha, heshan).

parent(suranga, deshan).
parent(suranga, heshan).

parent(lumbini, kavishka).
parent(lumbini, neluja).

parent(rasika, kavishka).
parent(rasika, neluja).


male(sumanathilaka).
male(nihal).
male(sriyanandha).
male(anandha).
male(sunil).
male(kumaranandha).
male(yasapala).
male(rasika).
male(sahan).
male(nishan).
male(ranga).
male(sasanka).
male(mithila).
male(sameera).
male(seshan).
male(ishan).
male(deshan).
male(heshan).
male(neluja).
male(kasun).

female(nikagolla).
female(wimala).
female(indralatha).
female(nandhani).
female(kamala).
female(suranga).
female(lumbini).
female(sewmini).
female(buddhi).
female(nanga).
female(rosi).
female(kavishka).

couple(sumanathilaka, nikagolla).
couple(yasapala, wimala).
couple(nihal, indralatha).
couple(kumaranandha, suranga).
couple(anandha, kamala).
couple(nandhini, sunil).
couple(lumbini, rasika).
couple(nishan, hansika).
couple(buddhi, ranga).
couple(nanga, sajith).
couple(rosi, sameera).


/* rules */

mother(X, Y) :-
    parent(X, Y),
    female(X).

father(X, Y) :-
    parent(X, Y),
    male(X).

child(X, Y) :-
    parent(Y, X).

partner(X, Y) :-
    child(Z, X),
    child(Z, Y),
    X \= Y.

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

grandchild(X, Y) :-
    grandparent(Y, X).

grandfather(X, Y) :-
    grandparent(X, Y),
    male(X).

grandmother(X, Y) :-
    grandparent(X, Y),
    female(X).

paternalgrandfather(X, Y) :-
    father(X, Z),
    father(Z, Y).

maternalgrandfather(X, Y) :-
    father(X, Z),
    mother(Z, Y).

paternalgrandmother(X, Y) :-
    mother(X, Z),
    father(Z, Y).

maternalgrandmother(X, Y) :-
    mother(X, Z),
    mother(Z, Y).

greatgrandparent(X, Y) :-
    parent(P, Y),
    grandparent(X, P).

greatgrandchild(X, Y) :-
    greatgrandparent(Y, X).

son(X, Y) :-
    child(X, Y),
    male(X).

daughter(X, Y) :-
    child(X, Y),
    female(X).

granddaughter(X, Y) :-
    grandchild(X, Y),
    female(X).

grandson(X, Y) :-
    grandchild(X, Y),
    male(X).

ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(Z, Y),
    ancestor(X, Z).

descendant(X, Y) :-
    ancestor(Y, X).

sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

sister(X, Y) :-
    sibling(X, Y),
    female(X),
    X \= Y.

brother(X, Y) :-
    sibling(X, Y),
    male(X),
    X \= Y.

uncle(X, Y) :-
    brother(X, Z),
    child(Y, Z).

aunt(X, Y) :-
    sister(X, Z),
    child(Y, Z).

cousin(X, Y) :-
    grandparent(Z, X),
    grandparent(Z, Y),
    \+sibling(X, Y),
    X \= Y.

paternalgrandparents(X, Y) :-
    mother(X, Z),
    father(Z, Y);father(X, Z),
    father(Z, Y).

cousin1(X, Y) :-
         aunt(Z, Y),mother(Z, X) ;   
          uncle(Z, Y),father(Z, X).
