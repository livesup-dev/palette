defmodule Palette.Components.Restrict do
  use Phoenix.Component

  attr(:permission, :string, default: "")
  attr(:permissions, :any, default: [])
  slot(:inner_block, required: true)

  def restrict(%{permission: permission, permissions: permissions} = assigns) do
    assigns
    |> render(String.contains?(permission, permissions))
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
