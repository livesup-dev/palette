defmodule Palette.Components.Radio do
  use Phoenix.Component

  attr(:name, :string, default: "")
  attr(:value, :string, default: nil)
  attr(:rest, :global)
  attr(:class, :string, default: "")
  attr(:label, :string, required: true)
  attr(:checked, :boolean, default: false)

  attr(:color, :atom,
    default: :default,
    values: [:default, :primary, :secondary, :info, :success, :warning, :error, :dark, :light]
  )

  def radio(%{color: color, class: custom_class} = assigns) do
    full_class = "#{custom_class} #{class(color)}"

    assigns =
      assigns
      |> assign(:class, full_class)

    ~H"""
    <label class="inline-flex items-center space-x-2">
      <input type="radio" value={@value} name={@name} class={@class} {@rest} checked={@checked} />
      <p><%= @label %></p>
    </label>
    """
  end

  defp class(:default),
    do:
      "form-radio is-basic h-5 w-5 rounded-full border-slate-400/70 checked:border-slate-500 checked:bg-slate-500 hover:border-slate-500 focus:border-slate-500 dark:border-navy-400 dark:checked:bg-navy-400"

  defp class(:primary),
    do:
      "form-radio is-basic h-5 w-5 rounded-full border-slate-400/70 checked:border-primary checked:bg-primary hover:border-primary focus:border-primary dark:border-navy-400 dark:checked:border-accent dark:checked:bg-accent dark:hover:border-accent dark:focus:border-accent"

  defp class(:secondary),
    do:
      "form-radio is-basic h-5 w-5 rounded-full border-slate-400/70 checked:border-secondary checked:bg-secondary hover:border-secondary focus:border-secondary dark:border-navy-400 dark:checked:border-secondary-light dark:checked:bg-secondary-light dark:hover:border-secondary-light dark:focus:border-secondary-light"

  defp class(:info),
    do:
      "form-radio is-basic h-5 w-5 rounded-full border-slate-400/70 checked:!border-info checked:bg-info hover:!border-info focus:!border-info dark:border-navy-400"

  defp class(:success),
    do:
      "form-radio is-basic h-5 w-5 rounded-full border-slate-400/70 checked:!border-success checked:bg-success hover:!border-success focus:!border-success dark:border-navy-400"

  defp class(:warning),
    do:
      "form-radio is-basic h-5 w-5 rounded-full border-slate-400/70 checked:!border-warning checked:bg-warning hover:!border-warning focus:!border-warning dark:border-navy-400"

  defp class(:error),
    do:
      "form-radio is-basic h-5 w-5 rounded-full border-slate-400/70 checked:!border-error checked:bg-error hover:!border-error focus:!border-error dark:border-navy-400"
end
