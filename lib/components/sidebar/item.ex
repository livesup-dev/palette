defmodule Palette.Components.Sidebar.Item do
  use Phoenix.Component

  attr(:label, :string, required: true)
  attr(:path, :string, required: true)
  attr(:permission, :string, default: "")
  attr(:permissions, :any, default: [])

  def sidebar_item(assigns) do
    Palette.Auth.Restricter.do_render(__MODULE__, :_do_sidebar_item, assigns)
  end

  def _do_sidebar_item(assigns) do
    ~H"""
    <li>
      <.link
        navigate={@path}
        class="flex py-2 text-xs+ tracking-wide outline-none transition-colors duration-300 ease-in-out"
        x-data="navLink"
      >
        <%= @label %>
      </.link>
    </li>
    """
  end
end
