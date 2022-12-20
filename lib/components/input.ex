defmodule Palette.Components.Input do
  use Phoenix.Component

  attr(:label, :string, required: true)
  attr(:name, :string, required: true)
  attr(:value, :string, default: nil)
  attr(:required, :boolean, default: false)
  attr(:placeholder, :string, default: "")
  attr(:rest, :global)

  def text(assigns) do
    ~H"""
    <label for={@name} class="block">
      <span><%= @label %><span :if={@required}>*</span></span>
      <input
        required={@required}
        type="text"
        value={@value}
        name={@name}
        placeholder={@placeholder}
        class="form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
        {@rest}
      />
    </label>
    """
  end

  attr(:label, :string, required: true)
  attr(:name, :string, required: true)
  attr(:value, :string, default: nil)
  attr(:placeholder, :string, default: "")
  attr(:rows, :integer, default: 4)
  attr(:required, :boolean, default: false)
  attr(:rest, :global)

  def textarea(assigns) do
    ~H"""
    <label class="block">
      <span>
        <%= @label %><span :if={@required}>*</span>
      </span>
      <textarea
        required={@required}
        name={@name}
        rows={@rows}
        placeholder={@placeholder}
        class="form-textarea mt-1.5 w-full resize-none rounded-lg border border-slate-300 bg-transparent p-2.5 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
        {@rest}
      ><%= @value %></textarea>
    </label>
    """
  end
end
