defmodule Palette.Components.FromNow do
  use Phoenix.Component
  alias Palette.Utils.DateHelper

  attr(:value, :string, required: true)
  attr(:class, :string, default: "font-semibold leading-tight text-xs text-slate-400")

  def from_now(%{value: nil} = assigns) do
    ~H"""
    <span class={@class}>N/A</span>
    """
  end

  def from_now(%{value: value} = assigns) do
    assigns =
      assigns
      |> assign(:parsed_date, DateHelper.from_now(value))

    ~H"""
    <span class={@class}><%= @parsed_date %></span>
    """
  end
end
