defmodule Palette.Components.Select do
  use Phoenix.Component
  use Phoenix.HTML

  attr(:label, :string, required: true)
  attr(:name, :string, required: true)
  attr(:values, :string, required: true)
  attr(:form, :map, required: true)
  attr(:selected, :string, default: nil)
  attr(:required, :boolean, default: false)

  def select(%{values: values} = assigns) do
    assigns =
      assigns
      |> assign(:values, add_empty_value(values) |> sort_values())

    ~H"""
    <label class="block">
      <span><%= @label %><span :if={@required}>*</span></span>
      <%= select(@form, @name, @values,
        selected: @selected,
        required: @required,
        class:
          "form-select mt-1.5 w-full rounded-lg border border-slate-300 bg-white px-3 py-2 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:bg-navy-700 dark:hover:border-navy-400 dark:focus:border-accent"
      ) %>
    </label>
    """
  end

  defp add_empty_value(values) do
    [[key: "", value: ""]] ++ values
  end

  defp sort_values(values) do
    values
    |> Enum.sort_by(fn item -> item[:value] end)
  end
end
