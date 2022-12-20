defmodule Palette.Components.ActionLink do
  use Phoenix.Component

  attr(:path, :string, required: true)
  attr(:type, :atom, default: :patch, values: [:navigate, :patch])
  attr(:tooltip, :string, required: true)
  attr(:icon, :atom, default: :add, values: [:add])
  attr(:custom_icon, :string, default: nil)

  def action_link(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        "btn h-9 w-9 p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25"
      )
      |> manage_icon()

    Palette.Auth.Restricter.do_render(__MODULE__, :_do_link, assigns)
  end

  def _do_link(%{type: :patch} = assigns) do
    ~H"""
    <.link patch={@path} class={@class} x-tooltip.light={"'#{@tooltip}'"}>
      <i class={"#{@icon} fa-xl"}></i>
    </.link>
    """
  end

  def _do_link(%{type: :navigate} = assigns) do
    ~H"""
    <.link navigate={@path} class={@class} x-tooltip.light={"'#{@tooltip}'"}>
      <i class={"#{@icon} fa-xl"}></i>
    </.link>
    """
  end

  def manage_icon(assigns) do
    icon =
      (assigns[:custom_icon] ||
         assigns[:icon])
      |> icon()

    assigns
    |> assign(:icon, icon)
  end

  def icon(:add), do: "fa-solid fa-circle-plus"
  def icon(custom) when is_binary(custom), do: custom
  def icon(_), do: nil
end
