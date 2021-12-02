IO.read(:stdio, :all)
  |> String.split("\n")
  |> Enum.reduce(
    { 0, 0 },
    fn line, { x, y } ->
      split = String.split(line, " ")
      direction = List.first(split)
      units = List.last(split) |> String.to_integer

      case direction do
        "forward" -> { x + units, y }
        "down" -> { x, y + units }
        "up" -> { x, y - units }
      end
    end
  )
  |> Tuple.product
  |> IO.inspect
