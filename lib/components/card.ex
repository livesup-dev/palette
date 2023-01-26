defmodule Palette.Components.Card do
  use Phoenix.Component

  attr(:color, :atom, default: :default, values: [:default, :success, :warning, :error])
  attr(:title, :string, default: nil)
  attr(:description, :string, default: nil)
  attr(:class, :string, default: "")
  attr(:title_class, :string, default: "text-lg font-medium tracking-wide line-clamp-1")
  slot(:inner_block, required: false)

  def card(%{color: color, class: class} = assigns) do
    assigns =
      assigns
      |> assign(:class, "#{class(color)} #{class}")

    ~H"""
    <div class={@class}>
      <div :if={@title}>
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

  defp class(:default), do: "card px-4 py-4 sm:px-5"
  defp class(:warning), do: "rounded-lg bg-warning px-4 py-4 text-white sm:px-5"
  defp class(:success), do: "rounded-lg bg-success px-4 py-4 text-white sm:px-5"
  defp class(:error), do: "rounded-lg bg-error px-4 py-4 text-white sm:px-5"
end
