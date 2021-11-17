%описываем возможные передвижения шаров
move(A,B):-append(Begin,[b,'_'|End],A),
		   append(Begin,['_',b|End],B).
move(A,B):-append(Begin,['_',w|End],A),
		   append(Begin,[w,'_'|End],B).
move(A,B):-append(Begin,[b,w,'_'|End],A),
		   append(Begin,['_',w,b|End],B).
move(A,B):-append(Begin,['_',b,w|End],A),
		   append(Begin,[w,b,'_'|End],B).

%основной предикат поиска в глубину		   
search_dpth(Start,Finish):-dpth([Start],Finish,Way),
						   show_answer(Way).

%делаем один шаг						   
prolong([Temp|Tail],[New,Temp|Tail]):-move(Temp,New),
									  not(member(New,[Temp|Tail])).

%рекурсивный поиск в глубину									  
dpth([Finish|Tail],Finish,[Finish|Tail]).
dpth(TempWay,Finish,Way):-prolong(TempWay,NewWay),
						  dpth(NewWay,Finish,Way).

%вывод результата						  
show_answer([_]):-!.
show_answer([A,B|Tail]):-show_answer([B|Tail]),
						 nl,
						 write(B),
						 write(' -> '),
						 write(A).
