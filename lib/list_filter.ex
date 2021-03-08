defmodule ListFilter do
  def call(list), do: filter(list, 0)

  defp filter(list, default_value) do
    Enum.reduce(
      list,
      default_value,
      fn el, acc ->
        Integer.parse(el)
        |> handle_element(acc)
      end
    )
  end

  defp handle_element(:error, acc), do: acc
  defp handle_element({integer, _binary}, acc) do
    if is_odd(integer), do: acc + 1, else: acc
  end

  defp is_odd(number), do: rem(number, 2) != 0
end
