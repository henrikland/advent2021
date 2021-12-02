IO.read(:stdio, :all)
  |> String.split("\n")
  |> Enum.reduce(
    { 0, 0, 0 },
    fn line, { x, y, aim } ->
      split = String.split(line, " ")
      direction = List.first(split)
      units = List.last(split) |> String.to_integer

      case direction do
        "forward" -> { x + units, y + aim * units, aim }
        "down" -> { x, y, aim + units }
        "up" -> { x, y, aim - units }
      end
    end
  )
  |> Tuple.delete_at(2)
  |> Tuple.product
  |> IO.inspect
