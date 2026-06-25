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

consome(reator, 8).
consome(motor_alpha, 6).
consome(motor_beta, 4).
consome(canhao_valverde, 7).
consome(canhao_son, 6).
consome(escudo_cunha, 5).
consome(radar_neymar, 6).
consome(ia_navegacao, 6).
consome(sensor, 3).

precisa(motor_alpha, reator).
precisa(canhao_valverde, reator).
precisa(canhao_son, reator).
precisa(escudo_cunha, reator).
precisa(radar_neymar, reator).
precisa(ia_navegacao, radar_neymar).
precisa(ia_navegacao, sensor).
precisa(sensor, reator).

possui(hangar_alpha, reator).
possui(hangar_alpha, motor_alpha).
possui(hangar_alpha, canhao_valverde).
possui(hangar_alpha, canhao_son).

possui(hangar_beta, reator).
possui(hangar_beta, radar_neymar).
possui(hangar_beta, sensor).

possui(hangar_gamma, canhao_valverde).
possui(hangar_gamma, canhao_son).

hangar_combate(H) :-
    possui(H, A),
    possui(H, B),
    categoria(A, combate),
    categoria(B, combate),
    A \= B.

falta_energia(H) :-
    \+ (possui(H, P), categoria(P, propulsao)).

main :-
    writeln('Exercicio 2'),
    forall(
        (hangar_combate(H), falta_energia(H)),
        writeln(H)
    ).
