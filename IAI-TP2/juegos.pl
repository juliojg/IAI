
/* juegos.pl
digital games identification game.
start with ?- go.
*/

go :- hypothesize(Game),
write('I guess that the game is: '),
write(Game),undo,
nl.


/* hypotheses to be tested */
hypothesize(call_of_duty)
:- call_of_duty, !.
hypothesize(overwatch)
:- overwatch, !.
hypothesize(league_of_legends)
:- league_of_legends, !.
hypothesize(the_witcher_3)
:- the_witcher_3, !.
hypothesize(dark_souls)
:- dark_souls, !.
hypothesize(minecraft)
:- minecraft, !.
hypothesize(bayonetta)
:- bayonetta, !.
hypothesize(the_elder_scrolls_V)
:- the_elder_scrolls_V, !.
hypothesize(nier_automata)
:- nier_automata, !.
hypothesize(fifa)
:- fifa, !.
hypothesize(doom)
:- doom, !.
hypothesize(limbo)
:- limbo, !.
hypothesize(portal)
:- portal, !.
hypothesize(gta)
:- gta, !.
hypothesize(dead_space)
:- dead_space, !.
hypothesize(half_life)
:- half_life, !.
hypothesize(devil_may_cry)
:- devil_may_cry, !.
hypothesize(unknown).


/* no diagnosis */
/* games identification rules */

call_of_duty :- fps,
verify(action),use_internet.

overwatch :- fps,use_internet.

league_of_legends :- moba,
verify(strategy). 

mass_effect :-
verify(role),verify(science_fiction),verify(third_person),verify(open_world),verify(action),verify(shooter).

the_witcher_3 :- 
verify(role),verify(fantasy),verify(action),verify(third_person),verify(open_world).

dark_souls :-
verify(survival),verify(fantasy),verify(terror),verify(third_person).

minecraft :- verify(survival),verify(open_world).

devil_may_cry :- 
verify(third_person), verify(fantasy),hack_and_slash.

half_life :-
fps, verify(action), verify(science_fiction).

dead_space :-
verify(third_person),verify(shooter), verify(terror), verify(science_fiction), verify(survival).

gta :-
verify(third_person),verify(shooter), verify(open_world),verify(action).

portal :-
verify(first_person),verify(puzzle),verify(science_fiction).

limbo :- verify(platform), verify(puzzle).

doom :- fps, verify(science_fiction),verify(terror). 

fifa :- verify(sports),use_internet.

nier_automata :- hack_and_slash,verify(role),verify(science_fiction).

the_elder_scrolls_V :- verify(role),verify(fantasy),verify(open_world).

bayonetta :- hack_and_slash,verify(fantasy).

%assert(Game :- verify(Attr)),assert(Game :- verify(Attr1))

fps :- verify(first_person),verify(shooter).
use_internet :- verify(online),verify(multiplayer).
moba :- use_internet,verify(battle_arena),verify(has_minions).
hack_and_slash :- verify(combat),verify(third_person),verify(action).
/* how to ask questions */

ask(Question) :-
write('Does the game have the following attribute: '),
write(Question),
write('? '),
read(Response),
nl,
((Response == yes ; Response == y)->assert(yes(Question)); assert(no(Question)), fail).

:- dynamic yes/1,no/1.
/* How to verify something */
verify(S):-
(yes(S)-> true ; (no(S) -> fail ; ask(S))).

/* undo all yes/no assertions */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.


