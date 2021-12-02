IO.read(:stdio, :all)
  |> String.split("\n")
  |> Enum.map(&(String.to_integer &1))
  |> Enum.chunk_every(3, 1, :discard)
  |> Enum.map(&(Enum.sum &1))
  |> Enum.chunk_every(2, 1, :discard)
  |> Enum.filter(fn chunk -> List.first(chunk) < List.last(chunk) end)
  |> Enum.count
  |> IO.inspect
