defmodule Palette.Components.Avatars.Avatar do
  @moduledoc """
  ## Example

      <.avatar
        type={:rounded}
      />
  """

  use Phoenix.Component

  attr(:type, :atom, values: [:rounded, :square, :squircle], default: :rounded)
  attr(:size, :string, default: "8")
  attr(:img, :string)
  attr(:custom_class, :string, default: "")

  def avatar(assigns) do
    assigns = assigns |> assign(:img_class, type(assigns.type))

    ~H"""
    <div class={"avatar h-#{@size} w-#{@size} #{@custom_class}"}>
      <img class={@img_class} src={@img} alt="avatar" />
    </div>
    """
  end

  defp type(:rounded), do: "rounded-full"
  defp type(:square), do: "rounded-lg"
  defp type(:squircle), do: "mask is-squircle"
end
