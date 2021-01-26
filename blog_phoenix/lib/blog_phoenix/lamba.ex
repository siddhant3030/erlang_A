# Erlang/OTP 23 [erts-11.1] [source] [64-bit] [smp:12:12] [ds:12:12:10] [async-threads:1] [hipe]

# Interactive Elixir (1.10.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)> nums = [1, 2, 3]
# [1, 2, 3]
# iex(2)> Enum.map(nums, fn x -> x * 3 end)
# [3, 6, 9]
# iex(3)> trip = fn x -> x * 3 end
# #Function<44.97283095/1 in :erl_eval.expr/5>
# iex(4)> Enum.map(nums, triple)
# ** (CompileError) iex:4: undefined function triple/0
#     (stdlib 3.13.2) lists.erl:1358: :lists.mapfoldl/3
#     (stdlib 3.13.2) lists.erl:1359: :lists.mapfoldl/3
# iex(4)> Enum.map(nums, trip)
# [3, 6, 9]
# iex(5)> trip.(4)
# 12
# iex(6)> trip = &(&1 * 3)
# #Function<44.97283095/1 in :erl_eval.expr/5>
# iex(7)> trip.(4)
# 12
# iex(8)> Enum.reduce(nums, 1, fn a, b -> a * b end)
# 6
# iex(9)> prod = $($1 * $2)
# ** (SyntaxError) iex:9: unexpected token: "$" (column 8, code point U+0024)

# iex(9)> prod = &(&1 * &2)
# &:erlang.*/2
# iex(1
