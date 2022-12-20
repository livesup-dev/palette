defmodule Palette.Components.Form do
  use Phoenix.Component

  slot(:inner_block, required: true)
  attr(:for, :any, required: true)
  attr(:event, :string, default: "save")
  attr(:target, :map, default: nil)

  def xform(assigns) do
    ~H"""
    <div class="px-4 py-4 sm:px-5">
      <.form :let={f} for={@for} phx-submit={@event} phx-target={@target} role="form text-left">
        <div class="mt-4 space-y-4">
          <%= render_slot(@inner_block, f) %>
        </div>
      </.form>
    </div>
    """
  end
end
