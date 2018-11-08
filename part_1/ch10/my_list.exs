defmodule MyList do
  def flatten(list, result \\ [])
  def flatten([], result), do: result

  def flatten([head | tail], result) when is_list(head) do
    result = flatten(head, result)
    result = flatten(tail, result)
    result
  end

  def flatten([head | tail], result) do
    result = result ++ [head]
    flatten(tail, result)
  end
end
