defmodule Palette.Components.Switch do
  use Phoenix.Component
  import Palette.Components.FieldHelper

  attr(:label, :string, required: true)
  attr(:name, :string, default: nil)
  attr(:value, :string, default: nil)
  attr(:field, Phoenix.HTML.FormField, default: nil)
  attr(:required, :boolean, default: false)
  attr(:class, :string, default: "")
  attr(:rest, :global)
  attr(:errors, :list, default: [])

  attr(:color, :atom,
    default: :default,
    values: [:default, :primary, :secondary, :info, :success, :warning, :error]
  )

  def switch(%{class: class, color: color} = assigns) do
    assigns =
      assigns
      |> assign_basic_attrs()
      |> assign(
        :class,
        "form-switch h-5 w-10 rounded-full bg-slate-300 before:rounded-full before:bg-slate-50 #{color(color)} #{class}"
      )

    ~H"""
    <label for={@name} class="inline-flex items-center space-x-2">
      <input
        required={@required}
        type="checkbox"
        value={@value}
        name={@name}
        id={@name}
        class={@class}
        {@rest}
      />
      <span><%= @label %></span>
      <Palette.Components.Input.error :for={msg <- @errors}>
        <%= msg %>
      </Palette.Components.Input.error>
    </label>
    """
  end

  defp color(:default),
    do:
      "checked:bg-slate-500 checked:before:bg-white dark:bg-navy-900 dark:before:bg-navy-300 dark:checked:bg-navy-400 dark:checked:before:bg-white"

  defp color(:primary),
    do:
      "checked:bg-primary checked:before:bg-white dark:bg-navy-900 dark:before:bg-navy-300 dark:checked:bg-accent dark:checked:before:bg-white"

  defp color(:secondary),
    do:
      "checked:bg-secondary checked:before:bg-white dark:bg-navy-900 dark:before:bg-navy-300 dark:checked:bg-secondary-light dark:checked:before:bg-white"

  defp color(:info),
    do:
      "checked:!bg-info checked:before:bg-white dark:bg-navy-900 dark:before:bg-navy-300 dark:checked:before:bg-white"

  defp color(:success),
    do:
      "checked:!bg-success checked:before:bg-white dark:bg-navy-900 dark:before:bg-navy-300 dark:checked:before:bg-white"

  defp color(:warning),
    do:
      "checked:!bg-warning checked:before:bg-white dark:bg-navy-900 dark:before:bg-navy-300 dark:checked:before:bg-white"

  defp color(:error),
    do:
      "checked:!bg-error checked:before:bg-white dark:bg-navy-900 dark:before:bg-navy-300 dark:checked:before:bg-white"
end
