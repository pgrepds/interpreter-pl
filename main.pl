/**
 *  MIT License
 *  Copyright (c) 2020 David Scholz
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */
main :- write('interpret: '), read(Input), tokenize_atom(Input, R), phrase(programm(E), R), write(E).

programm(Input) -->  start_programm_terminal, statements(Input), end_programm_terminal.

statements([]) --> [].
statements([S|Rest]) --> statement(S), semicolon, statements(Rest).

statement([S|Rest]) --> ifexpr, (boolexpression, thenexpr, statement(S)) ; statements(Rest).
statement(S) --> elseexpr, statement(S).
statement(S) --> abstractexpression(S1), add, abstractexpression(S2),  { S is S1 + S2 }.
statement(S) --> abstractexpression(S1), sub, abstractexpression(S2), { S is S1 - S2 }.
statement(S) --> abstractexpression(S).

abstractexpression(E) --> multexpression(E).
abstractexpression(E) --> divexpression(E).
abstractexpression(_) --> boolexpression.

divexpression(E) --> expression(E1), div, expression(E2), { E is E1 / E2 }.
divexpression(E) --> expression(E).

multexpression(E) --> expression(E1), mult, expression(E2), { E is E1 * E2 }.
multexpression(E) --> expression(E).

boolexpression --> expression(E1), greater , expression(E2), { E1 > E2 }.
boolexpression --> expression(E1), smaller, expression(E2),  { E1 < E2 }.
boolexpression --> expression(E1), geq, expression(E2), { E1 >= E2 }.
boolexpression --> expression(E1), seq, expression(E2), { E1 =< E2 }.
boolexpression --> expression(E1), eq, expression(E2), { E1 =:= E2 }.
boolexpression --> expression(E1), neq, expression(E2), { E1 =\= E2 }.

expression(E) --> left_paranthese, statement(E), right_paranthese.
expression(E) --> integer(E, _).
expression(E) --> {number(E)}.

ifexpr --> ['if'].
thenexpr --> ['then'].
elseexpr --> ['else'].
greater --> [>].
smaller --> [<].
geq --> [>=].
seq --> [<=].
neq --> [=\=].
eq --> [=:=].
div --> [/].
mult --> [*].
sub --> [-].
add --> [+].
start_programm_terminal --> ['{'].
end_programm_terminal --> ['}'].
right_paranthese --> [')'].
left_paranthese --> ['('].
semicolon --> [;].

integer(N, 1) --> digit(N).
integer(N, C) --> digit(ND), integer(NN, C1), {
                                 C is C1 * 10,
                                 N is ND * C + NN}.

digit(N) --> [0], {N is 0}
           ; [1], {N is 1}
           ; [2], {N is 2}
           ; [3], {N is 3}
           ; [4], {N is 4}
           ; [5], {N is 5}
           ; [6], {N is 6}
           ; [7], {N is 7}
           ; [8], {N is 8}
           ; [9], {N is 9}.
