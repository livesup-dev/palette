defmodule Palette.Components.Link do
  use Phoenix.Component

  attr(:path, :string, required: true)
  attr(:type, :atom, default: :patch)
  attr(:rest, :global)

  def view_link(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        "btn h-8 w-8 p-0 text-info hover:bg-info/20 focus:bg-info/20 active:bg-info/25"
      )
      |> assign(:icon, "fa-regular fa-eye")

    Palette.Auth.Restricter.do_render(__MODULE__, :_do_link, assigns)
  end

  attr(:path, :string, required: true)
  attr(:type, :atom, default: :patch)
  attr(:class, :string, default: "")
  attr(:rest, :global)

  def delete_link(%{class: class} = assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        "btn h-8 w-8 p-0 text-error hover:bg-error/20 focus:bg-error/20 active:bg-error/25 #{class}"
      )
      |> assign(:icon, "fa fa-trash-alt")

    Palette.Auth.Restricter.do_render(__MODULE__, :_do_link, assigns)
  end

  attr(:path, :string, required: true)
  attr(:type, :atom, default: :patch)
  attr(:rest, :global)

  def edit_link(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        "btn h-8 w-8 p-0 text-info hover:bg-info/20 focus:bg-info/20 active:bg-info/25"
      )
      |> assign(:icon, "fa fa-edit")

      "edit link" |> dbg

    Palette.Auth.Restricter.do_render(__MODULE__, :_do_link, assigns)
  end

  def _do_link(%{type: :href} = assigns) do
    ~H"""
    <.link href={@path} class={@class} {@rest}>
      <i class={@icon}></i>
    </.link>
    """
  end

  def _do_link(%{type: :patch} = assigns) do
    ~H"""
    <.link patch={@path} class={@class} {@rest}>
      <i class={@icon}></i>
    </.link>
    """
  end

  def _do_link(%{type: :navigate} = assigns) do
    ~H"""
    <.link navigate={@path} class={@class} {@rest}>
      <i class={@icon}></i>
    </.link>
    """
  end
end
