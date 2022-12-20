defmodule Palette.Components.AppHeaderWrapper do
  use Phoenix.Component

  slot(:inner_block, doc: "Page content", required: true)

  def app_header_wrapper(assigns) do
    ~H"""
    <nav class="header print:hidden">
      <%= render_slot(@inner_block) %>
    </nav>
    """
  end
end
