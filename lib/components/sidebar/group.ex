defmodule Palette.Components.Sidebar.Group do
  use Phoenix.Component

  attr(:label, :string, required: true)
  attr(:path, :string, required: true)
  attr(:icon, :string, required: true)

  def sidebar_group(assigns) do
    ~H"""
    <.link
      navigate={@path}
      x-tooltip.placement.right={"'#{@label}'"}
      class="flex h-11 w-11 items-center justify-center rounded-lg outline-none transition-colors duration-200 hover:bg-primary/20 focus:bg-primary/20 active:bg-primary/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25"
    >
      <i class={"#{@icon} fa-xl"}></i>
    </.link>
    """
  end
end
