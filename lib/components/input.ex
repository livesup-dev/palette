defmodule Palette.Components.Input do
  use Phoenix.Component
  import Palette.Components.FieldHelper

  attr(:label, :string, required: true)
  attr(:name, :string, default: nil)
  attr(:value, :string, default: nil)
  attr(:field, Phoenix.HTML.FormField, default: nil)
  attr(:required, :boolean, default: false)
  attr(:placeholder, :string, default: "")
  attr(:class, :string, default: "")
  attr(:rest, :global)
  attr(:errors, :list, default: [])

  def text(%{class: class} = assigns) do
    assigns =
      assigns
      |> assign_basic_attrs()
      |> assign(
        :class,
        "form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent #{class}"
      )

    ~H"""
    <label for={@name} class="block">
      <span><%= @label %><span :if={@required} class="ml-1">*</span></span>
      <input
        required={@required}
        type="text"
        value={@value}
        name={@name}
        id={@name}
        placeholder={@placeholder}
        class={@class}
        {@rest}
      />
      <Palette.Components.Input.error :for={msg <- @errors}>
        <%= msg %>
      </Palette.Components.Input.error>
    </label>
    """
  end

  attr(:label, :string, required: true)
  attr(:name, :string, required: true)
  attr(:value, :string, default: nil)
  attr(:required, :boolean, default: false)
  attr(:field, Phoenix.HTML.FormField, default: nil)
  attr(:placeholder, :string, default: "")
  attr(:class, :string, default: "")
  attr(:rest, :global)
  attr(:errors, :list, default: [])
  slot(:sufix, required: true)

  def input_group(%{class: class} = assigns) do
    assigns =
      assigns
      |> assign_basic_attrs()
      |> assign(
        :class,
        "form-input w-full rounded-l-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:z-10 hover:border-slate-400 focus:z-10 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent #{class}"
      )

    ~H"""
    <div>
      <span><%= @label %><span :if={@required} class="ml-1">*</span></span>
      <label for={@name} class="mt-1.5 flex -space-x-px">
        <input
          required={@required}
          type="text"
          value={@value}
          name={@name}
          id={@name}
          placeholder={@placeholder}
          class={@class}
          {@rest}
        />
        <span class="flex items-center justify-center rounded-r-lg border border-slate-300 px-3.5 font-inter dark:border-navy-450">
          <%= render_slot(@sufix) %>
        </span>
      </label>
      <Palette.Components.Input.error :for={msg <- @errors}>
        <%= msg %>
      </Palette.Components.Input.error>
    </div>
    """
  end

  attr(:label, :string, required: true)
  attr(:name, :string, required: true)
  attr(:value, :string, default: nil)
  attr(:field, Phoenix.HTML.FormField, default: nil)
  attr(:required, :boolean, default: false)
  attr(:placeholder, :string, default: "")
  attr(:rest, :global)
  attr(:errors, :list, default: [])

  def datepicker(assigns) do
    assigns = assigns |> assign_basic_attrs()

    ~H"""
    <label
      id={"pick-#{@name}"}
      for={@name}
      class="block flatpickr"
      phx-update="ignore"
      phx-hook="Pickr"
    >
      <span><%= @label %><span :if={@required} class="ml-1">*</span></span>
      <input
        required={@required}
        type="text"
        value={@value}
        name={@name}
        id={@name}
        placeholder={@placeholder}
        data-input
        class="form-input mt-1.5 w-full rounded-lg border border-slate-300 bg-transparent px-3 py-2 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
        {@rest}
      />
      <Palette.Components.Input.error :for={msg <- @errors}>
        <%= msg %>
      </Palette.Components.Input.error>
    </label>
    """
  end

  attr(:name, :string, default: nil)
  attr(:value, :string, default: nil)
  attr(:rest, :global)
  attr(:field, Phoenix.HTML.FormField, default: nil)

  def hidden_input(assigns) do
    assigns = assigns |> assign_basic_attrs()

    ~H"""
    <input type="hidden" value={@value} name={@name} id={@name} {@rest} />
    """
  end

  attr(:label, :string, required: true)
  attr(:name, :string, default: nil)
  attr(:value, :string, default: nil)
  attr(:field, Phoenix.HTML.FormField, default: nil)
  attr(:placeholder, :string, default: "")
  attr(:rows, :integer, default: 4)
  attr(:required, :boolean, default: false)
  attr(:rest, :global)
  attr(:errors, :list, default: [])

  def textarea(assigns) do
    assigns = assigns |> assign_basic_attrs()

    ~H"""
    <label class="block">
      <span>
        <%= @label %><span :if={@required} class="ml-1">*</span>
      </span>
      <textarea
        required={@required}
        name={@name}
        id={@name}
        rows={@rows}
        placeholder={@placeholder}
        class="form-textarea mt-1.5 w-full resize-none rounded-lg border border-slate-300 bg-transparent p-2.5 placeholder:text-slate-400/70 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
        {@rest}
      ><%= @value %></textarea>
      <Palette.Components.Input.error :for={msg <- @errors}>
        <%= msg %>
      </Palette.Components.Input.error>
    </label>
    """
  end

  @doc """
  Generates a generic error message.
  """
  slot(:inner_block, required: true)

  def error(assigns) do
    ~H"""
    <p class="mt-3 flex gap-3 text-sm leading-6 text-rose-600 phx-no-feedback:hidden">
      <Palette.Components.Icon.icon
        name="hero-exclamation-circle-mini"
        class="mt-0.5 h-5 w-5 flex-none"
      />
      <%= render_slot(@inner_block) %>
    </p>
    """
  end
end
