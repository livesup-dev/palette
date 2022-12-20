defmodule Palette.Components.Restrict do
  use Phoenix.Component

  attr(:permission, :string)
  attr(:permissions, :any, required: true)
  slot(:inner_block, required: true)

  def restrict(%{permission: permission, permissions: permissions} = assigns) do
    assigns
    |> render(String.contains?(permissions, permission))
  end

  defp render(assigns, true) do
    ~H"""
    <%= render_slot(@inner_block) %>
    """
  end

  defp render(assigns, false) do
    ~H"""

    """
  end
end
