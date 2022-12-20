defmodule Palette.Components.Cards.DetailsCard do
  use Phoenix.Component
  alias Palette.Utils.DateHelper
  alias Palette.Utils.StringHelper

  attr(:title, :string, required: true)
  attr(:description, :string, default: "")
  slot(:inner_block, required: true)

  def details_card(assigns) do
    ~H"""
    <div class="rounded-lg bg-info/10 px-4 pb-5 dark:bg-navy-800 sm:px-5">
      <div class="space-y-4 py-3">
        <div>
          <h3 class="text-lg font-medium text-slate-700 dark:text-navy-100">
            <%= @title %>
          </h3>
          <p class="text-xs text-slate-400 dark:text-navy-300">
            <%= @description %>
          </p>
        </div>
        <div class="space-y-3 text-xs+">
          <%= render_slot(@inner_block) %>
        </div>
      </div>
    </div>
    """
  end

  attr(:label, :string, required: true)
  attr(:value, :string, required: true)
  attr(:format, :string, default: "clear", values: ["clear", "date_from_now"])

  def details_card_row(%{format: "date_from_now", value: value} = assigns) do
    assigns
    |> assign(:value, DateHelper.from_now(value))
    |> _details_card_row()
  end

  def details_card_row(%{format: "short_id", value: value} = assigns) do
    assigns
    |> assign(:value, StringHelper.short_id(value))
    |> _details_card_row()
  end

  def details_card_row(%{format: "clear"} = assigns) do
    assigns
    |> _details_card_row()
  end

  defp _details_card_row(assigns) do
    ~H"""
    <div class="flex justify-between">
      <p class="font-medium text-slate-700 dark:text-navy-100">
        <%= @label %>
      </p>
      <p class="text-right"><%= @value %></p>
    </div>
    """
  end
end
