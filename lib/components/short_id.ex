defmodule Palette.Components.ShortId do
  use Phoenix.Component

  attr(:value, :string, required: true)

  def short_id(assigns) do
    assigns =
      assigns
      |> assign_new(:short_id, fn -> make_it_short(assigns[:value]) end)

    ~H"""
    <span><%= @short_id %></span>
    """
  end

  defp make_it_short(id) do
    id
    |> String.split("-")
    |> List.first()
  end
end
