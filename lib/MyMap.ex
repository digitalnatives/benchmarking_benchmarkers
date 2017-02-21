defmodule MyMap do
    def map_tco(list, function) do
      Enum.reverse do_map_tco([], list, function)
    end
    defp do_map_tco(acc, [], _function) do
       acc
    end
    defp do_map_tco(acc, [head | tail], func) do
      do_map_tco([func.(head) | acc], tail, func)
    end

    def map_body([], _func), do: []
    def map_body([head | tail], func) do
       [func.(head) | map_body(tail, func)]
    end
end
