defmodule Palette.Components.Containers.OneColumnList do
  use Phoenix.Component

  slot(:inner_block, required: true)

  def one_column_list(assigns) do
    ~H"""
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 sm:gap-5 lg:grid-cols-1 lg:gap-6">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
