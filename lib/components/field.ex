defmodule Palette.Components.Field do
  use Phoenix.Component
  alias Palette.Components.CopyToClipboard
  alias Palette.Components.FromNow
  alias Palette.Utils.StringHelper

  attr(:value, :string, required: true)

  def id_field(assigns) do
    ~H"""
    <span>
      <span class="font-semibold text-slate-700 sm:ml-2 mr-1">
        ID:
      </span>
      <CopyToClipboard.copy_to_clipboard class="mb-2 leading-tight text-xs" value={@value} />
    </span>
    """
  end

  attr(:label, :string, required: true)
  attr(:value, :string, required: true)

  def date_field(assigns) do
    ~H"""
    <span>
      <span class="font-semibold text-slate-700 sm:ml-2 mr-1">
        <%= @label %>:
      </span>
      <FromNow.from_now value={@value} />
    </span>
    """
  end

  attr(:label, :string, required: true)
  attr(:value, :string, required: true)
  slot(:inner_block, required: false)

  def field(assigns) do
    ~H"""
    <span>
      <span class="font-semibold text-slate-700 sm:ml-2 mr-1">
        <%= @label %>:
      </span>
      <%= @value || render_slot(@inner_block) %>
    </span>
    """
  end

  attr(:value, :string, required: true)
  attr(:empty_value, :string, default: "")
  attr(:class, :string, default: "prose prose-sm dark:prose-invert")

  def markdown_field(%{value: value, empty_value: empty_value} = assigns) do
    assigns =
      assigns
      |> assign(:markdown, StringHelper.markdown_to_html(value || empty_value))

    ~H"""
    <div class={"#{@class}"}>
      <%= Phoenix.HTML.raw(@markdown) %>
    </div>
    """
  end
end
