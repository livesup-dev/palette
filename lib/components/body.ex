defmodule Palette.Components.Body do
  use Phoenix.Component

  slot(:inner_block, doc: "Body content", required: true)

  def body(assigns) do
    ~H"""
    <body x-data class="is-header-blur" x-bind="$store.global.documentBody">
      <%= render_slot(@inner_block) %>
    </body>
    """
  end
end
