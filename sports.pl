/* Juan Pablo Rinaldi */
/* start. para empezar! */

:- dynamic yes/1,no/1.

/* Borrar las respuestas */
undo :- retract(yes(_)), fail. 
undo :- retract(no(_)), fail.
undo.

/* Preguntar */
ask(Question) :-
	write('El deporte posee la siguiente característica: '), write(Question), write('? '),
	read(Response),
	nl,
	Response == si -> assert(yes(Question));
	assert(no(Question)), fail.

/* Verificar si una respuesta fue afirmativa, si todavia no hay respuesta, preguntar */
check(S) :-
(
	yes(S) -> true ;
	(
		no(S) -> fail ;
		ask(S)
	)
).

/* Verificar si una respuesta fue negativa, si todavia no hay respuesta, preguntar */
check_no(S) :-
(
	no(S) -> true ;
	(
		yes(S) -> fail ;
		ask(S)
	)
).
			
guess(futbol)	:- futbol, !.
guess(basket)	:- basket, !.
guess(tenis)	:- tenis, !.
guess(rugby)	:- rugby, !.
guess(golf)		:- golf, !.
guess(natacion)	:- natacion, !.
guess(ciclismo)	:- ciclismo, !.
guess(boxeo)	:- boxeo, !.
guess(desconocido).

futbol :-	check(tiene_pelota), check(es_en_equipos), check(partido_de_90_minutos).
basket :-	check(tiene_pelota), check(es_en_equipos), check(pelota_naranja).
tenis :-	check(tiene_pelota), check(pelota_verde).
rugby :-	check(tiene_pelota), check(es_en_equipos), check(pelota_ovalada).
golf :-		check(tiene_pelota), check_no(es_en_equipos), check(usa_instrumento_manos).
natacion :-	check(te_mojas), check_no(tiene_pelota).
ciclismo :-	check(tiene_ruedas), check_no(tiene_pelota).
boxeo :-	check(usa_guantes), check_no(tiene_pelota).

start :-	guess(Sport),
			write('El deporte es: '), write(Sport), nl,
			undo.