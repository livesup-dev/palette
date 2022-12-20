defmodule Palette.Components.PageWrapper do
  use Phoenix.Component

  slot(:inner_block, doc: "Page content", required: true)

  def page_wrapper(assigns) do
    ~H"""
    <div id="root" class="min-h-100vh flex grow bg-slate-50 dark:bg-navy-900" x-cloak>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end
end
