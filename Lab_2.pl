%Набатов кассир <=> Митерев счетовод
statement_1_1(Levin,Miterev,Nabatov) :- Nabatov=cashier,!,Miterev=accountant.
statement_1_2(Levin,Miterev,Nabatov) :- Miterev=accountant,!,Nabatov=cashier.

%Набатов счетовод <=> Митерев бухгалтер
statement_2_1(Levin,Miterev,Nabatov) :- Nabatov=accountant,!,Miterev=booker.
statement_2_2(Levin,Miterev,Nabatov) :- Miterev=booker,!,Nabatov=accountant.

%Митерев не кассир <=> Левин не счетовод 
statement_3_1(Levin,Miterev,Nabatov) :- Miterev=not(cashier),!,Levin=not(accountant).
statement_3_2(Levin,Miterev,Nabatov) :- Levin=not(accountant),!,Miterev=not(cashier).

%Левин бухгалтер <=> Набатов счетовод
statement_4_1(Levin,Miterev,Nabatov) :- Levin=booker,!,Nabatov=accountant.
statement_4_2(Levin,Miterev,Nabatov) :- Nabatov=accountant,!,Levin=booker.

statement_1_1(_,_,_).
statement_1_2(_,_,_).
statement_2_1(_,_,_).
statement_2_2(_,_,_).
statement_3_1(_,_,_).
statement_3_2(_,_,_).
statement_4_1(_,_,_).
statement_4_2(_,_,_).

%Все занимают разные должности
not_equal(Levin,Miterev,Nabatov) :- Levin\=Miterev,Nabatov\=Miterev,Levin\=Nabatov,!.

%Основная процедура
solve(Levin,Miterev,Nabatov) :- member(Levin,[cashier,accountant,booker]),
								member(Miterev,[cashier,accountant,booker]),
								member(Nabatov,[cashier,accountant,booker]),
								statement_1_1(Levin,Miterev,Nabatov),
								statement_1_2(Levin,Miterev,Nabatov),
								statement_2_1(Levin,Miterev,Nabatov),
								statement_2_2(Levin,Miterev,Nabatov),
								statement_3_1(Levin,Miterev,Nabatov),
								statement_3_2(Levin,Miterev,Nabatov),
								statement_4_1(Levin,Miterev,Nabatov),
								statement_4_2(Levin,Miterev,Nabatov),
								not_equal(Levin,Miterev,Nabatov).
								
