leng([],0). % вычисление длины списка
leng([X|T],N):-
	leng(T,N1),
	N is N1+1.

mem(X,[X|T]). % членство в списке
mem(X,[_|T]):-
	mem(X,T).

app([],X,X). % слияние списков
app([X|Y],Z,[X|T]):-
	app(Y,Z,T).

rem(X,[X|T],T). % удаление X из списка
rem(X,[Y|T],[Y|T1]):-
	rem(X,T,T1).

permute([],[]). % перестановки списка
permute(L,[X|T]):-
	rem(X,L,R),
	permute(R,T).

subl(X,L):- % подсписок
	app(Y1,Y2,L),
	app(X,X1,Y2).

deln([_|Y],1,Y):-!. % удаление элемента, стоящего
deln([X|Y],N,[X|L]):- % на n-ой позиции
	N1 is N-1,!,
	deln(Y,N1,L).

nummem(A,[e(A,_)|_]). % принадлежность к нумерованному списку
nummem(A,[_|Y]):-
	nummem(A,Y).

numapp(X,[],X). % слияние нумерованных списков
numapp(X,[e(C,D)|Y],M):-
	leng(X,N),
	N1 is N + 1,
	app(X,[e(C,N1)],L),
	numapp(L,Y,M).

dec([e(A,B)],[e(A,C)]):- % декремент номеров
	C is B-1.
dec([e(A,B)|C],[e(A,B1)|C1]):-
	B1 is B-1,
	dec(C,C1).

numrem(A,[e(A,N)],[]). % удаление вхождения эл-та из списка
numrem(A,[e(A,B)|C],C1):-
	dec(C,C1).
numrem(X,[A|C],[A|C1]):-
	numrem(X,C,C1).

numpermute([],[]). % перестановка нумерованного списка
numpermute(L,X):-
	permute(L,M),
	numapp([],M,X).

lastitem([X],X). % получение последнего эл-та (без использования стандартных предикатов).
lastitem([Y|L],X):-
	lastitem(L,X).
	
laststand(L,X):- % получение последнего эл-та (с использованием стандартных предикатов).
	app(T,[X],L).
	
numlast([e(A,N)],A). % получение последнего эл-та нумерованного списка( без исользования станд. предикатов)
numlast([e(A,N)|T],X):-
	numlast(T,X).

numlaststand(L,[]):- % получение последнего эл-та нумерованного списка( c исользованием станд. предикатов)
	length(L,0).
numlaststand(L,X):-
	length(L,N),
	deln(L,N,T),
	numapp(T,[e(X,N)],L).

suml([X],X). % сумма эл-тов числового списка
suml([X|T],N):-
	suml(T,N1),
	N is N1+X.

numsuml([e(X,N)],X).% сумма эл-тов числового нумерованного списка
numsuml([e(X,_)|T],N):-
	numsuml(T,N1),
	N is N1+X.
				 Ending = [_,_,_].
% предиката реверса списка:

reversl([X],[X]). 
reversl([X,Y],[Y,X]).
reversl(L,[X|R]):-
	lastitem(L,X),
	app(T,[X],L),
	reversl(T,R).
