defmodule Benchmark do
  require Benchee
    
  def run do
    map_fun = fn(element) -> element + 1 end
    inputs = %{
      "small" => Enum.to_list(1..10_000),
      "medium" => Enum.to_list(1..100_000),
      "big" => Enum.to_list(1..1_000_000),
      "verybig" => Enum.to_list(1..5_000_000)
    }

    Benchee.run(%{
      "tail-recursive" => fn(list) -> MyMap.map_tco(list, map_fun) end,
      "std-lib map"    => fn(list) -> Enum.map(list, map_fun) end,
      "body-recursive" => fn(list) -> MyMap.map_body(list, map_fun) end
    }, time: 20, warmup: 10, inputs: inputs)
  end
end
