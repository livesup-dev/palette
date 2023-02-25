defmodule Palette.Components.Card do
  use Phoenix.Component

  attr(:color, :atom, default: :default, values: [:default, :success, :warning, :error])
  attr(:title, :string, default: nil)
  attr(:description, :string, default: nil)
  attr(:class, :string, default: "")

  attr(:title_class, :string,
    default: "font-medium tracking-wide text-slate-700 dark:text-navy-100"
  )

  slot(:inner_block, required: false)

  def card(%{color: color, class: class} = assigns) do
    assigns =
      assigns
      |> assign(:class, "#{class(color)} #{class}")

    ~H"""
    <div class={@class}>
      <div :if={@title} class="my-3 flex h-8 items-center justify-between">
        <h2 class={@title_class}>
          <%= @title %>
        </h2>
      </div>
      <div class="pt-2">
        <p :if={@description}>
          <%= @description %>
        </p>
        <%= render_slot(@inner_block) %>
      </div>
    </div>
    """
  end

  attr(:label, :string, required: true)
  attr(:value, :string, default: nil)
  slot(:inner_block, required: false)

  def card_field(assigns) do
    ~H"""
    <div class="flex justify-between">
      <p class="line-clamp-1 text-slate-700 dark:text-navy-100">
        <%= @label %>
      </p>
      <p class="text-right"><%= @value || render_slot(@inner_block) %></p>
    </div>
    """
  end

  attr(:label, :string, required: true)
  attr(:icon_class, :string, required: true)
  attr(:tooltip, :string, default: "")

  def card_icon_field(assigns) do
    ~H"""
    <div class="flex justify-between">
      <p class="line-clamp-1 text-slate-700 dark:text-navy-100" x-tooltip.light={"'#{@tooltip}'"}>
        <%= @label %>
      </p>
      <p class="text-right">
        <i class={@icon_class} />
      </p>
    </div>
    """
  end

  def card_line(assigns) do
    ~H"""
    <div class="my-3 h-px bg-slate-200 dark:bg-navy-500"></div>
    """
  end

  defp class(:default), do: "card px-4 py-4 sm:px-5"
  defp class(:warning), do: "rounded-lg bg-warning px-4 py-4 text-white sm:px-5"
  defp class(:success), do: "rounded-lg bg-success px-4 py-4 text-white sm:px-5"
  defp class(:error), do: "rounded-lg bg-error px-4 py-4 text-white sm:px-5"
end
