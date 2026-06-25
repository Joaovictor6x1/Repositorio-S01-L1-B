% RELATÓRIO 15 — EXERCÍCIO 1

% BANCO DE DADOS
componente(son,        combate,     6).
componente(rodri,      sistemas,    6).
componente(yamal,      combate,     7).
componente(valverde,   propulsao,   4).
componente(camavinga,  propulsao,   3).
componente(mbappe,     sistemas,    6).
componente(vinicius,   fundamental, 8).
componente(bellingham, sistemas,    5).
componente(salah,      combate,     6).
componente(haaland,    fundamental, 9).

precisa(son,        valverde).
precisa(son,        camavinga).
precisa(yamal,      valverde).
precisa(yamal,      rodri).
precisa(rodri,      vinicius).
precisa(mbappe,     vinicius).
precisa(mbappe,     bellingham).
precisa(bellingham, camavinga).
precisa(salah,      valverde).
precisa(salah,      camavinga).

tem(hangar_alpha, valverde).
tem(hangar_alpha, camavinga).
tem(hangar_alpha, son).
tem(hangar_beta,  valverde).
tem(hangar_beta,  camavinga).
tem(hangar_beta,  rodri).
tem(hangar_beta,  vinicius).
tem(hangar_beta,  bellingham).
tem(hangar_gamma, vinicius).
tem(hangar_gamma, bellingham).
tem(hangar_gamma, camavinga).

% REGRA
peca_critica(P) :-
    componente(P, _, Consumo),
    Consumo > 5,
    precisa(P1, P),
    precisa(P2, P),
    P1 \= P2.

% QUERIES
:- initialization(main, main).
main :-
    write('=== Pecas Criticas ==='), nl,
    forall(peca_critica(P), writeln(P)),
    nl,
    write('=== Sistemas com 6 MW sem dependentes ==='), nl,
    forall(
        (componente(P, sistemas, 6), \+ precisa(_, P)),
        writeln(P)
    ).
