defmodule Palette.Components.Progress do
  use Phoenix.Component

  attr(:color, :atom,
    default: :default,
    values: [:default, :primary, :secondary, :info, :success, :warning, :error]
  )

  def progress(assigns) do
    assigns = assigns |> assign(:class_color, color(assigns.color))

    ~H"""
    <div class="progress h-1 bg-slate-150 dark:bg-navy-500">
      <div class={"is-indeterminate relative w-4/12 rounded-full #{@class_color}"}></div>
    </div>
    """
  end

  defp color(:default), do: "bg-slate-500 dark:bg-navy-400"
  defp color(:primary), do: "bg-primary dark:bg-accent"
  defp color(:secondary), do: "bg-secondary"
  defp color(:info), do: "bg-info"
  defp color(:success), do: "bg-success"
  defp color(:warning), do: "bg-warning"
  defp color(:error), do: "bg-error"
end
