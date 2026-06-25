:- initialization(main).

categoria(reator, fundamental).
categoria(motor_alpha, propulsao).
categoria(motor_beta, propulsao).
categoria(canhao_valverde, combate).
categoria(canhao_son, combate).
categoria(escudo_cunha, defesa).
categoria(radar_neymar, sistemas).
categoria(ia_navegacao, sistemas).
categoria(sensor, sistemas).

precisa(motor_alpha, reator).
precisa(canhao_valverde, reator).
precisa(canhao_son, reator).
precisa(escudo_cunha, reator).
precisa(radar_neymar, reator).
precisa(ia_navegacao, radar_neymar).
precisa(ia_navegacao, sensor).
precisa(sensor, reator).

possui(hangar_beta, reator).
possui(hangar_beta, radar_neymar).
possui(hangar_beta, sensor).

possui(hangar_gamma, canhao_valverde).
possui(hangar_gamma, canhao_son).

item_faltante(Hangar, Peca) :-
    precisa(_, Peca),
    \+ possui(Hangar, Peca).

pode_montar(Hangar, Componente) :-
    categoria(Componente, C),
    C \= fundamental,
    \+ (precisa(Componente, X),
        \+ possui(Hangar, X)).

main :-
    writeln('Componentes do hangar_beta:'),
    forall(
        pode_montar(hangar_beta, X),
        writeln(X)
    ),
    writeln('Hangar_gamma pode montar ia_navegacao?'),
    (pode_montar(hangar_gamma, ia_navegacao)
        -> writeln(sim)
        ; writeln(nao)).
