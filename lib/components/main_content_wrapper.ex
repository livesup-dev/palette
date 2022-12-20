defmodule Palette.Components.MainContentWrapper do
  use Phoenix.Component

  slot(:inner_block, doc: "Page content", required: true)

  def main_content_wrapper(assigns) do
    ~H"""
    <%= render_slot(@inner_block) %>
    """
  end
end
