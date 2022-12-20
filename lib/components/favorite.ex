defmodule Palette.Components.Favorite do
  use Phoenix.Component

  attr(:value, :boolean, default: false)

  def favorite(%{value: value} = assigns) do
    assigns =
      assigns
      |> assign(:current_value, to_string(value))
      |> assign(:icon, icon_class(value))

    ~H"""
    <a href="#" phx-click="favorite" phx-value-current={@current_value}><i class={@icon}></i></a>
    """
  end

  defp icon_class(true), do: "fa-solid fa-star text-yellow-400"
  defp icon_class(false), do: "fa-regular fa-star"
end
