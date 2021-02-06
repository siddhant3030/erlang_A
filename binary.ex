#Binary Lessons

# Interactive Elixir (1.10.4) - press Ctrl+C to exit (type h() ENTER for help)
# iex(1)>   <<119, 111, 114, 100>> == "word"
# true
# iex(2)>   <<119, 111, 114, 100>> = "word"
# "word"
# iex(3)>   <<first, 111, 114, 100>> = "word"
# "word"
# iex(4)> first
# 119
# iex(5)> 111
# 111
# iex(6)> <<111>>
# "o"
# iex(7)> <<114>>
# "r"
# iex(8)> <<258>>
# <<2>>
# iex(9)> <<258::9>>
# <<129, 0::size(1)>>
# iex(10)> <<258::16>>
# <<1, 2>>
# iex(11)> color = 0x58e
# 1422
# iex(12)> <<r::4, g::4, b::4>> = <<color::12>>
# <<88, 14::size(4)>>
