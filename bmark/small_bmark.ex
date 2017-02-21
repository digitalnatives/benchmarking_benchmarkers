defmodule SmallBmark do
  use Bmark

  @input Enum.to_list(1..10_000)

  bmark :tail_recursive do
    map_fun = fn(element) -> element + 1 end
    MyMap.map_tco(@input, map_fun)
  end

  bmark :stdlib_map do
    map_fun = fn(element) -> element + 1 end
    Enum.map(@input, map_fun)
  end

  bmark :body_recursive do
    map_fun = fn(element) -> element + 1 end
    MyMap.map_body(@input, map_fun)
  end
end
