defmodule SmallBench do
  use Benchfella

  setup_all do
    input = %{map_fun: fn(element) -> element + 1 end,
              list: Enum.to_list(1..10_000)}
    {:ok, input}
  end

  bench "tail-recursive" do
    MyMap.map_tco(bench_context.list, bench_context.map_fun)
  end

  bench "std-lib map" do
    Enum.map(bench_context.list, bench_context.map_fun)
  end

  bench "body-recursive" do
    MyMap.map_body(bench_context.list, bench_context.map_fun)
  end
end
