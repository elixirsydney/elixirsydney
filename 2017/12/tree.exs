defmodule A do
def t(0,_),do: ""
def t(1,c),do: c
def t(n,c),do: c<>t(n-1,c)
def f(i,c\\"0"),do: IO.puts(String.pad_leading(t(i,c),)<>t(i-1,c))
end
[{1,"*"},{9,"0"},{1,"H"}]|>Enum.each(fn{n,c}->for n<-1..n,do: A.f(n,c) end)
