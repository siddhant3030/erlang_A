-module(world).
-export([hello/0]).
-define(GREETING, "hello world").


hello() -> ?GREETING.