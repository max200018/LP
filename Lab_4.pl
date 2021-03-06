symbol(1,"+").
symbol(1,"-").
symbol(2,"*").
symbol(2,"/").

term(1,"+",Exp1,Exp2,plus1(Exp1,Exp2)).
term(1,"-",Exp1,Exp2,minus(Exp1,Exp2)).
term(2,"*",Exp1,Exp2,multiply(Exp1,Exp2)).
term(2,"/",Exp1,Exp2,divide(Exp1,Exp2)).

%Конвертация из стандартной записи в промежуточную
expression(N,List,Other,Exp) :- N<3, 
								N1 is N+1,
                                expression(N1,List,List1,Exp1),!, 
								subexpression(N,List1, Other,Exp1,Exp).
								expression(3,[Int| Other], Other,is_int(I)) :- I=Int.
								
subexpression(N,[S|List], Other,Exp1,Exp) :- symbol(N,S), 
											 N1 is N+1,
                                             expression(N1,List,List1,Exp2),!,
                                             term(N,S,Exp1,Exp2,Term),
                                             subexpression(N,List1,Other,Term,Exp).
subexpression(_,List,List,Exp,Exp).



%Соединение списков
append1([H|L1],L2,[H|L]) :- append1(L1,L2,L).
append1([],L,L).

%Конвертация из промежуточной записи в префиксную
convert(plus1(Exp1,Exp2),["+"|List]) :- convert(Exp1,L1),
                                        convert(Exp2,L2),
                                        append1(L1,L2,List).
										
convert(minus(Exp1,Exp2),["-"|List]) :- convert(Exp1,L1),
										convert(Exp2,L2),
										append1(L1,L2,List).
										
convert(multiply(Exp1,Exp2),["*"|List]) :- convert(Exp1,L1),
                                           convert(Exp2,L2),
                                           append1(L1,L2,List).
										   
convert(divide(Exp1,Exp2),["/"|List]) :- convert(Exp1,L1),
                                         convert(Exp2,L2),
                                         append1(L1,L2,List).										 
convert(is_int(I),[Int]) :- I=Int.

%Основной предикат
calculate(List,Res) :- expression(1,List,_,Term),
					   convert(Term,Res).
