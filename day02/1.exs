IO.read(:stdio, :all)
|> String.split("\n")
|> Enum.reduce(
  {0, 0},
  fn line, {x, y} ->
    [direction, units] =
      String.split(line, " ")
      |> then(fn [first, second] ->
        [first, second |> String.to_integer()]
      end)

    case direction do
      "forward" -> {x + units, y}
      "down" -> {x, y + units}
      "up" -> {x, y - units}
    end
  end
)
|> Tuple.product()
|> IO.inspect()
