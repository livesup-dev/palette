defmodule Palette.Components.Favorite do
  use Phoenix.Component

  attr(:value, :boolean, default: false)

  attr(:class, :string,
    default:
      "btn h-9 w-9 p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25"
  )

  def favorite(%{value: value} = assigns) do
    assigns =
      assigns
      |> assign(:current_value, to_string(value))
      |> assign(:icon, icon_class(value))
      |> assign(:tooltip, tooltip(value))

    ~H"""
    <a
      href="#"
      class={@class}
      phx-click="favorite"
      phx-value-current={@current_value}
      x-tooltip.light={"'#{@tooltip}'"}
    >
      <i class={"#{@icon} fa-xl"}></i>
    </a>
    """
  end

  defp icon_class(true), do: "fa-solid fa-star text-yellow-400"
  defp icon_class(false), do: "fa-regular fa-star"

  defp tooltip(true), do: "Remove from favorites"
  defp tooltip(false), do: "Add to favorites"
end
