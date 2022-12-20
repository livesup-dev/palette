defmodule Palette.Components.Badges.GlowBadge do
  use Phoenix.Component

  attr(:description, :string, required: true)
  attr(:class, :string, default: "")

  attr(:color, :atom,
    default: :default,
    values: [:default, :primary, :secondary, :info, :success, :warning, :error]
  )

  def glow_badge(%{color: color, class: custom_class} = assigns) do
    full_class = "#{custom_class} #{class(color)}"

    assigns =
      assigns
      |> assign(:class, full_class)

    ~H"""
    <div class={@class}><%= @description %></div>
    """
  end

  defp class(:default),
    do:
      "badge bg-slate-150 text-slate-800 shadow-soft shadow-slate-200/50 dark:bg-navy-500 dark:text-navy-100 dark:shadow-navy-450/50"

  defp class(:primary),
    do:
      "badge bg-primary text-white shadow-soft shadow-primary/50 dark:bg-accent dark:shadow-accent/50"

  defp class(:secondary),
    do: "badge bg-secondary text-white shadow-soft shadow-secondary/50"

  defp class(:info), do: "badge bg-info text-white shadow-soft shadow-info/50"
  defp class(:success), do: "badge bg-success text-white shadow-soft shadow-success/50"
  defp class(:warning), do: "badge bg-warning text-white shadow-soft shadow-warning/50"
  defp class(:error), do: "badge bg-error text-white shadow-soft shadow-error/50"
end
