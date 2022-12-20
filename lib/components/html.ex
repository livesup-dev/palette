defmodule Palette.Components.Html do
  use Phoenix.Component

  slot(:inner_block, required: true)

  def html(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <%= render_slot(@inner_block) %>
    </html>
    """
  end
end
