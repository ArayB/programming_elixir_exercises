defmodule MyList do
  def len([]), do: 0
  def len([_head | tail]), do: 1 + len(tail)

  def square([]), do: []
  def square([head | tail]), do: [head * head | square(tail)]

  def add_1([]), do: []
  def add_1([head | tail]), do: [head + 1 | add_1(tail)]

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  def reduce([], value, _) do
    value
  end

  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def mapsum(list, func), do: reduce(map(list, func), 0, &(&1 + &2))

  def max([head | tail]) do
    reduce(tail, head, &(if &1 > &2, do: &1, else: &2))
  end

  def caesar(list, n) do
    func = fn
      a when a + n > 122 -> 97 + (a + n - 122)
      a -> a + n
    end
    map(list, func)
  end

  def span(from, to, list \\ [])
  def span(from, to, list) when from > to do
    list
  end
  def span(from, to, list) do
    span(from + 1, to, list ++ [from])
  end
end
