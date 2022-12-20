defmodule Palette.Components.Badges.Badge do
  use Phoenix.Component

  attr(:description, :string, required: true)
  attr(:class, :string, default: "")

  attr(:color, :atom,
    default: :default,
    values: [:default, :primary, :secondary, :info, :success, :warning, :error, :dark, :light]
  )

  def badge(%{color: color, class: custom_class} = assigns) do
    full_class = "#{custom_class} #{class(color)}"

    assigns =
      assigns
      |> assign(:class, full_class)

    ~H"""
    <div class={@class}><%= @description %></div>
    """
  end

  defp class(:default),
    do: "badge bg-slate-150 text-slate-800 dark:bg-navy-500 dark:text-navy-100"

  defp class(:primary),
    do: "badge bg-primary text-white dark:bg-accent"

  defp class(:secondary),
    do: "badge bg-secondary text-white"

  defp class(:info), do: "badge bg-info text-white"
  defp class(:success), do: "badge bg-success text-white"
  defp class(:warning), do: "badge bg-warning text-white"
  defp class(:error), do: "badge bg-error text-white"
  defp class(:dark), do: "badge bg-navy-700 text-white dark:bg-navy-900"
  defp class(:light), do: "badge bg-slate-150 text-slate-800"
end
