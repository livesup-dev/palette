defmodule Palette.Components.Sidebar do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div class="sidebar ">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
