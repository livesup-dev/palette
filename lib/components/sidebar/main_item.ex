defmodule Palette.Components.Sidebar.MainItem do
  use Phoenix.Component

  attr(:label, :string, required: true)
  attr(:path, :string, required: true)
  attr(:icon, :string, required: true)
  attr(:active, :boolean, default: false)

  def sidebar_main_item(assigns) do
    ~H"""
    <.link navigate={@path} class={item_class(@active)} x-tooltip.placement.right={"'#{@label}'"}>
      <i class={"text-xl #{@icon}"}></i>
    </.link>
    """
  end

  defp item_class(false),
    do:
      "flex h-11 w-11 items-center justify-center rounded-lg outline-none transition-colors duration-200 hover:bg-primary/20 focus:bg-primary/20 active:bg-primary/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25"

  defp item_class(true),
    do:
      "flex h-11 w-11 items-center justify-center rounded-lg bg-primary/10 text-primary outline-none transition-colors duration-200 hover:bg-primary/20 focus:bg-primary/20 active:bg-primary/25 dark:bg-navy-600 dark:text-accent-light dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90"
end
