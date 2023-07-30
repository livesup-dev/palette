defmodule Palette.Components.Avatars.InitialAvatar do
  @moduledoc """
  ## Example

      <.initial_avatar
        type={:rounded}
      />
  """

  use Phoenix.Component

  attr(:type, :atom,
    values: [:rounded, :square, :squircle, :soft, :bordered, :square_soft],
    default: :rounded
  )

  attr(:size, :string, default: "8")
  attr(:text, :string)
  attr(:custom_class, :string, default: "")

  attr(:color, :atom,
    default: :default,
    values: [:default, :primary, :secondary, :info, :success, :warning, :error]
  )

  def initial_avatar(%{color: color, type: type} = assigns) do
    assigns =
      assigns
      |> assign(:color_class, color(color, type))
      |> assign(:type, type(type))

    ~H"""
    <div class={"avatar h-#{@size} w-#{@size} #{@custom_class}"}>
      <div class={"is-initial #{@type} #{@color_class}"}>
        <%= @text %>
      </div>
    </div>
    """
  end

  defp type(:rounded), do: "rounded-full"
  defp type(:square), do: "rounded-lg"
  defp type(:squircle), do: "mask is-squircle"
  defp type(:bordered), do: "rounded-full border"
  defp type(:soft), do: type(:rounded)

  defp color(:default, :soft),
    do:
      "bg-slate-200/10 text-base uppercase text-slate-600 dark:bg-navy-500/10 dark:text-navy-100"

  defp color(:default, :bordered),
    do:
      "border-slate-200/30 bg-slate-200/10 text-base uppercase text-slate-600 dark:bg-navy-500/10 dark:text-navy-100"

  defp color(:default, _),
    do: "bg-slate-200 text-base uppercase text-slate-600 dark:bg-navy-500 dark:text-navy-100"

  defp color(:primary, :soft),
    do:
      "bg-primary/10 text-base uppercase text-primary dark:bg-accent-light/10 dark:text-accent-light"

  defp color(:primary, :bordered),
    do:
      "border-primary/30 bg-primary/10 text-base uppercase text-primary dark:bg-accent-light/10 dark:text-accent-light"

  defp color(:primary, _),
    do: "bg-primary text-base uppercase text-white dark:bg-accent"

  defp color(:secondary, :soft),
    do:
      "bg-secondary/10 text-base uppercase text-secondary dark:bg-secondary-light/10 dark:text-secondary-light"

  defp color(:secondary, :bordered),
    do:
      "border-secondary/30 bg-secondary/10 text-base uppercase text-secondary dark:bg-secondary-light/10 dark:text-secondary-light"

  defp color(:secondary, _),
    do: "bg-secondary text-base uppercase text-white"

  defp color(:info, :soft), do: "bg-info/10 text-base uppercase text-info"
  defp color(:info, :bordered), do: "border-info/30 bg-info/10 text-base uppercase text-info"
  defp color(:info, _), do: "bg-info text-base uppercase text-white"

  defp color(:success, :soft), do: "bg-success/10 text-base uppercase text-success"

  defp color(:success, :bordered),
    do: "border-success/30 bg-success/10 text-base uppercase text-success"

  defp color(:success, _), do: "bg-success text-base uppercase text-white"

  defp color(:warning, :soft), do: "bg-warning/10 text-base uppercase text-warning"

  defp color(:warning, :bordered),
    do: "border-warning/30 border-warning/30 bg-warning/10 text-base uppercase text-warning"

  defp color(:warning, _), do: "bg-warning text-base uppercase text-white"

  defp color(:error, :soft), do: "bg-error/10 text-base uppercase text-error"
  defp color(:error, :bordered), do: "border-error/30 bg-error/10 text-base uppercase text-error"
  defp color(:error, _), do: "bg-error text-base uppercase text-white"
end
