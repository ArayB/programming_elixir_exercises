defmodule MyEnum do
  def all?([], _func), do: true

  def all?([head | tail], func) do
    case func.(head) do
      true ->
        all?(tail, func)

      false ->
        false
    end
  end

  def any?([], _func), do: false

  def any?([head | tail], func) do
    case func.(head) do
      true ->
        true

      false ->
        any?(tail, func)
    end
  end

  def each([], _func), do: :ok

  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter(list, func, result \\ [])
  def filter([], _func, result), do: result

  def filter([head | tail], func, result) do
    result =
      if func.(head) do
        result ++ [head]
      else
        result
      end

    filter(tail, func, result)
  end

  def split(list, size, result \\ [])
  def split([], _size, result), do: {result, []}

  def split([head | tail], size, result) do
    result = result ++ [head]

    if length(result) == size do
      {result, tail}
    else
      split(tail, size, result)
    end
  end

  def take(list, amount, result \\ [])
  def take([], _amount, result), do: result

  def take([head | tail], amount, result) do
    result = result ++ [head]

    if length(result) == amount do
      result
    else
      take(tail, amount, result)
    end
  end
end
