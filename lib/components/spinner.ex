defmodule Palette.Components.Spinner do
  use Phoenix.Component

  attr(:size, :string, default: "7")
  attr(:type, :atom, default: :basic, values: [:basic, :elastic])

  attr(:color, :atom,
    default: :default,
    values: [:default, :primary, :secondary, :info, :success, :warning, :error]
  )

  def spinner(assigns) do
    assigns =
      assigns
      |> assign(:color_class, color(assigns.color))
      |> assign(:type_class, type(assigns.type))

    ~H"""
    <div class={"spinner #{@type_class} h-#{@size} w-#{@size} animate-spin rounded-full border-[3px] #{@color_class}"}>
    </div>
    """
  end

  defp color(:default),
    do: "border-slate-500 border-r-transparent dark:border-navy-300 dark:border-r-transparent"

  defp color(:primary),
    do: "border-primary border-r-transparent dark:border-accent dark:border-r-transparent"

  defp color(:secondary), do: "border-secondary border-r-transparent"
  defp color(:info), do: "border-info border-r-transparent"
  defp color(:success), do: "border-success border-r-transparent"
  defp color(:warning), do: "border-warning border-r-transparent"
  defp color(:error), do: "border-error border-r-transparent"

  defp type(:basic), do: ""
  defp type(:elastic), do: "is-elastic"
end
