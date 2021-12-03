IO.read(:stdio, :all)
  |> String.split("\n")
  |> Enum.reduce(
    { 0, 0, 0 },
    fn line, { x, y, aim } ->
      [direction, units] = String.split(line, " ")
        |> then(fn [first, second] ->
          [first, second |> String.to_integer]
        end
      )

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
