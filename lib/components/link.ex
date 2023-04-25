defmodule Palette.Components.Link do
  use Phoenix.Component
  alias Palette.Components.ShortId

  attr(:path, :string, required: true)
  attr(:type, :atom, default: :patch, values: [:href, :patch, :navigate])
  attr(:rest, :global)
  attr(:permission, :string, default: "")
  attr(:permissions, :any, default: [])

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
  attr(:permission, :string, default: "")
  attr(:permissions, :any, default: [])

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
  attr(:permission, :string, default: "")
  attr(:permissions, :any, default: [])

  def edit_link(assigns) do
    assigns =
      assigns
      |> assign(
        :class,
        "btn h-8 w-8 p-0 text-info hover:bg-info/20 focus:bg-info/20 active:bg-info/25"
      )
      |> assign(:icon, "fa fa-edit")

    Palette.Auth.Restricter.do_render(__MODULE__, :_do_link, assigns)
  end

  attr(:path, :string, required: true)
  attr(:id, :string, required: true)
  attr(:rest, :global)
  attr(:permission, :string)
  attr(:permissions, :any, default: [])

  def id_link(assigns) do
    Palette.Auth.Restricter.do_render(__MODULE__, :_do_id_link, assigns)
  end

  def _do_id_link(assigns) do
    ~H"""
    <.link
      navigate={@path}
      class="text-primary transition-colors hover:text-primary-focus dark:text-accent-light dark:hover:text-accent"
    >
      <ShortId.short_id value={@id} />
    </.link>
    """
  end

  @doc """
  Renders a back navigation link.

  ## Examples

      <.back_link navigate={~p"/posts"}>Back to posts</.back_link>
  """
  attr(:navigate, :any, required: true)
  slot(:inner_block, required: true)

  def back_link(assigns) do
    ~H"""
    <div class="mt-16">
      <.link
        navigate={@navigate}
        class="text-sm font-semibold leading-6 text-zinc-900 hover:text-zinc-700"
      >
        <Palette.Components.Icon.icon name="hero-arrow-left-solid" class="h-3 w-3" />
        <%= render_slot(@inner_block) %>
      </.link>
    </div>
    """
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
