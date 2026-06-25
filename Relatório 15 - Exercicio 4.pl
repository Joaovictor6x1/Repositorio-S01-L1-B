:- initialization(main).

categoria(reator, fundamental).
categoria(motor_alpha, propulsao).
categoria(canhao_valverde, combate).
categoria(radar_neymar, sistemas).

precisa(motor_alpha, reator).
precisa(canhao_valverde, reator).
precisa(radar_neymar, reator).

peca_raiz(P) :-
    \+ precisa(P, _).

peca_final(P) :-
    \+ precisa(_, P).

main :-
    writeln('Pecas raiz que nao sao propulsao:'),
    forall(
        (peca_raiz(P), categoria(P, C), C \= propulsao),
        writeln(P)
    ).
