IO.read(:stdio, :all)
|> String.split("\n")
|> Enum.map(&String.graphemes(&1))
|> Enum.zip_reduce(
  {"", ""},
  fn list, {epsilon, gamma} ->
    if Enum.count(list, fn bit -> bit === "1" end) > floor(Enum.count(list) / 2) do
      {epsilon <> "1", gamma <> "0"}
    else
      {epsilon <> "0", gamma <> "1"}
    end
  end
)
|> then(fn {epsilon, gamma} -> {String.to_integer(epsilon, 2), String.to_integer(gamma, 2)} end)
|> Tuple.product()
|> IO.inspect()
