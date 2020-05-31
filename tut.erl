-module(tut).

-import(string, [len/1, concat/2, chr/2, substr/3, str/2, to_lower/1, to_upper/2]).

-export([hello_world/0, add/2, atom_stuff/0, main/0, mains/0]).

hello_world() -> 
    io:fwrite("Hello World\n").

main() -> compare(4, 4.0).

compare(A, B) -> 
    A =:= B,
    A =/= B,
    A == B,
    A /= B.

mains() -> 
    say_hello(french).

say_hello(X) -> 
    case X of
        french -> 'Bon';
        german -> 'hey';
        english -> 'hello'
    end.


add(A, B) -> 
    atom_stuff(),
    hello_world(),
    A + B.

atom_stuff() ->
    'An Atom'.
