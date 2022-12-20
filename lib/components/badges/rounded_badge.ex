defmodule Palette.Components.Badges.RoundedBadge do
  use Phoenix.Component

  attr(:description, :string, required: true)
  attr(:class, :string, default: "")

  attr(:color, :atom,
    default: :default,
    values: [:default, :primary, :secondary, :info, :success, :warning, :error, :dark, :light]
  )

  def rounded_badge(%{color: color, class: custom_class} = assigns) do
    full_class = "#{custom_class} #{class(color)}"

    assigns =
      assigns
      |> assign(:class, full_class)

    ~H"""
    <div class={@class}><%= @description %></div>
    """
  end

  defp class(:default),
    do: "badge rounded-full bg-slate-150 text-slate-800 dark:bg-navy-500 dark:text-navy-100"

  defp class(:primary),
    do: "badge rounded-full bg-primary text-white dark:bg-accent"

  defp class(:secondary),
    do: "badge rounded-full bg-secondary text-white"

  defp class(:info), do: "badge rounded-full bg-info text-white"
  defp class(:success), do: "badge rounded-full bg-success text-white"
  defp class(:warning), do: "badge rounded-full bg-warning text-white"
  defp class(:error), do: "badge rounded-full bg-error text-white"
  defp class(:dark), do: "badge rounded-full bg-navy-700 text-white dark:bg-navy-900"
  defp class(:light), do: "badge rounded-full bg-slate-150 text-slate-800"
end
