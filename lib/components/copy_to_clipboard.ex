defmodule Palette.Components.CopyToClipboard do
  use Phoenix.Component
  alias Palette.Utils.StringHelper

  attr(:class, :string)
  attr(:value, :string, required: true)

  def copy_to_clipboard(assigns) do
    class =
      if assigns[:class] do
        "#{assigns[:class]} cursor-pointer select-none"
      else
        "text-xs cursor-pointer select-none"
      end

    label =
      assigns
      |> Map.get(:label, StringHelper.short_id(assigns[:value]))

    assigns =
      assigns
      |> assign(:class, class)
      |> assign(:label, label)

    ~H"""
    <span @click="$clipboard(input)" class={@class} x-data={ "{input: '#{@value}'}" }>
      <%= @label %>
    </span>
    """
  end
end
