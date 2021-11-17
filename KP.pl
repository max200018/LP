

father("Дмитрий Архипов", "Максим Архипов").
mother("Елена Фурманчук", "Максим Архипов").
father("Виктор Фурманчук", "Ирина Фурманчук").
mother("Наташа Антипова", "Ирина Фурманчук").
father("Виктор Фурманчук", "Елена Фурманчук").
mother("Наташа Антипова", "Елена Фурманчук").
father("Сергей Архипов", "Дмитрий Архипов").
mother("Ольга Коваль", "Дмитрий Архипов").
father("Алексей Машин", "Александр Машин").
mother("Ирина Фурманчук", "Александр Машин").
father("Александр Машин", "Ксения Машина").
mother("Алена Машина", "Ксения Машина").
father("Василий Коваль", "Ольга Коваль").
mother("Жанна Петрова", "Ольга Коваль").
father("Василий Коваль", "Александр Коваль").
mother("Жанна Петрова", "Александр Коваль").
father("Василий Коваль", "Анатолий Коваль").
mother("Жанна Петрова", "Анатолий Коваль").
father("Нина Антипова", "Наташа Антипова").
father("Нина Антипова", "Володя Антипов").
father("Анатолий Коваль", "Настя Коваль").
mother("Аня Коваль", "Настя Коваль").
father("Анатолий Коваль", "Елена Коваль").
mother("Аня Коваль", "Елена Коваль").
father("Николай Фурманчук", "Виктор Фурманчук").
mother("Анастасия Фурманчук", "Виктор Фурманчук").
father("Николай Фурманчук", "Сергей Фурманчук").
mother("Анастасия Фурманчук", "Сергей Фурманчук").
father("Сергей Фурманчук", "Таня Хофбауэр").
mother("Ольга Хофбауэр", "Таня Хофбауэр").
father("Сергей Фурманчук", "Екатерина Хофер").
mother("Ольга Хофбауэр", "Екатерина Хофер").
father("Михаэль Хофбауэр", "Аня Хофбауэр").
mother("Таня Хофбауэр", "Аня Хофбауэр").
father("Михаэль Хофбауэр", "Даня Хофер").
mother("Таня Хофбауэр", "Даня Хофер").
father("Володя Антипов", "Александр Антипов").
mother("// Антипов", "Александр Антипов").
father("Александр Антипов", "Денис Антипов").
mother("// Антипов", "Денис Антипов").
father("Лавр Коваль", "Василий Коваль").
mother("Анастасия Хофер", "Василий Коваль").
father("Николай Петров", "Жанна Петрова").
mother("Ольга Коваль", "Жанна Петрова").
father("Николай Петров", "Юдифь Петрова").
mother("Ольга Коваль", "Юдифь Петрова").
father("// Петрова", "Лена Петрова").
mother("Юдифь Петрова", "Лена Петрова").
father("// Петрова", "Ольга Петрова").
mother("Лена Петрова", "Ольга Петрова").
father("// Петрова", "Иван Петрова").
mother("Ольга Петрова", "Иван Петрова").

male("Максим Архипов").
male("Дмитрий Архипов").
male("Виктор Фурманчук").
male("Сергей Архипов").
male("Алексей Машин").
male("Александр Машин").
male("Василий Коваль").
male("Александр Коваль").
male("Анатолий Коваль").
male("Николай Фурманчук").
male("Сергей Фурманчук").
male("Михаэль").
male("Володя Антипов").
male("Александр Антипов").
male("Денис Антипов").
male("Лавр Коваль").
male("Николай Петров").
male("Иван").
male("Даня").

female("Елена Фурманчук").
female("Наташа Антипова").
female("Ольга Коваль").
female("Ирина Фурманчук").
female("Ксения Машина").
female("Алена").
female("Жанна Петрова").
female("Нина Антипова").
female("Елена Коваль").
female("Аня").
female("Настя Коваль").
female("Анастасия").
female("Таня Хофбауэр").
female("Ольга").
female("Аня").
female("Ольга").
female("Юдифь Петрова").
female("Лена").
female("Ольга").
female("Екатерина Хофер").
female("Анастасия").



dBrat(X, Y):-
    children(X, Rod),
    children(Rod, RodD),
    children(T, RodD),
    T \= Rod,
    children(Y, T),
    male(Y).
%shurin
shurin(Husb, Bro):- 
    wife(Husb, Wife), 
    brother(Wife, Bro).

% wife

wife(X, T):- 
    father(X, L), 
    mother(T, L), !.

brother(X, Z):- 
    (father(Y, X), father(Y, Z); mother(T, X), mother(T, Z)),
    male(Z),
    X \= Z.

%  Для X-а Y является

what_relation(Y, X, "brother") :-
    (father(T,X), father(T,Y); mother(T,X), mother(T,Y)),
    male(X),
    Y \= X.

what_relation(Y, X, "sister") :-
    (father(T,X), father(T,Y); mother(T,X), mother(T,Y)),
    female(X),
    Y \= X.

what_relation(Y, X, "mother") :-
    mother(X, Y),
    Y \= X.

what_relation(Y, X, "father") :-
    father(X, Y),
    Y \= X.

what_relation(X, Y, "husband") :-
    mother(X, L),
    father(Y, L),
    Y \= X.

what_relation(X, Y, "wife") :-
    father(X, L),
    mother(Y, L),
    Y \= X.

what_relation(X, Y, "son") :-
    (father(X, Y); mother(X, Y)),
    male(Y),
    Y \= X.

what_relation(X, Y, "daughter") :-
    (father(X, Y); mother(X, Y)),
    female(Y),
    Y \= X.

% ID-search

prolong_d([X|T], [Y1|T1], [Y,X|T], T1) :-
    what_relation(X, Y, Y1),
    not(member(Y, [X|T])).

relative_d(A, X, Y) :-
    between(1, 4, N),
    dpth([X], Y, _, L, N),
    reverse(L, A).

dpth([X|T], X, [X|T], [], 0).
dpth(P, F, L, A, N) :-
    N > 0,
    prolong_d(P, A, P1, A1),
    N1 is N - 1,
    dpth(P1, F, L, A1, N1).


% Поиск в ширину

chain_to_relations([], []).
chain_to_relations([_], []).
chain_to_relations([C1,C2|T], [R|N]) :-
    what_relation(C2, C1, R),
    chain_to_relations([C2|T], N).

relative_b(A, X, Y) :-
    bdth([[X]], Y, L),
    chain_to_relations(L, A).

prolong_b([X|T], [Y,X|T]) :-
    what_relation(Y, X, _),
    not(member(Y, [X|T])).

bdth([[X|T]|_], X, [X|T]).
bdth([P|QI], X, R) :-
    findall(Z, prolong_b(P, Z), T),
    append(QI, T, QO),  
    bdth(QO, X, R), !.
bdth([_|T], Y, L) :-
    bdth(T, Y, L).

