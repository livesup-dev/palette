defmodule Palette.Components.Select do
  use Phoenix.Component
  use Phoenix.HTML

  @doc """
  Renders a list of select input options with the given one selected.
  ## Examples
      <.select
        name="language"
        selected={@language}
        options={[en: "English", pl: "Polski", fr: "Français"]} />
  """
  attr(:id, :any)
  attr(:name, :any)
  attr(:value, :any, default: nil)
  attr(:label, :string, default: nil)
  attr(:prompt, :string, default: nil, doc: "the prompt for select inputs")
  attr(:entities, :list, default: nil, doc: "a list of structs to convert to options")
  attr(:options, :list, doc: "the options to pass to Phoenix.HTML.Form.options_for_select/2")
  attr(:multiple, :boolean, default: false, doc: "the multiple flag for select inputs")
  attr(:rest, :global, include: ~w(autocomplete cols disabled form max maxlength min minlength
                                   pattern placeholder readonly required rows size step))
  attr(:errors, :list, default: [])

  def select(%{entities: nil} = assigns) do
    assigns
    |> _do_select()
  end

  def select(%{entities: entities} = assigns) do
    options = Enum.map(entities, fn entity -> [key: entity.name, value: entity.id] end)

    assigns =
      with %{value: %Phoenix.HTML.FormField{} = field} <- assigns do
        assigns
        |> assign(:value, field.value)
        |> assign(:errors, field.errors)
      end

    assigns
    |> assign(:options, options)
    |> _do_select()
  end

  def _do_select(assigns) do
    ~H"""
    <div phx-feedback-for={@name}>
      <Palette.Components.Label.label for={@id}><%= @label %></Palette.Components.Label.label>
      <select
        id={@id}
        name={@name}
        class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-zinc-500 focus:border-zinc-500 sm:text-sm"
        multiple={@multiple}
        {@rest}
      >
        <option :if={@prompt} value=""><%= @prompt %></option>
        <%= Phoenix.HTML.Form.options_for_select(@options, @value) %>
      </select>
      <Palette.Components.Label.error :for={msg <- @errors}>
        <%= msg %>
      </Palette.Components.Label.error>
    </div>
    """
  end

  # attr(:label, :string, required: true)
  # attr(:name, :string, required: true)
  # attr(:values, :string, required: true)
  # attr(:form, :map, required: true)
  # attr(:selected, :string, default: nil)
  # attr(:required, :boolean, default: false)

  # def select(%{values: values} = assigns) do
  #   assigns =
  #     assigns
  #     |> assign(:values, add_empty_value(values) |> sort_values())

  #   ~H"""
  #   <label class="block">
  #     <span><%= @label %><span :if={@required}>*</span></span>
  #     <%= select(@form, @name, @values,
  #       selected: @selected,
  #       required: @required,
  #       class:
  #         "form-select mt-1.5 w-full rounded-lg border border-slate-300 bg-white px-3 py-2 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:bg-navy-700 dark:hover:border-navy-400 dark:focus:border-accent"
  #     ) %>
  #   </label>
  #   """
  # end

  # defp add_empty_value(values) do
  #   [[key: "", value: ""]] ++ values
  # end

  # defp sort_values(values) do
  #   values
  #   |> Enum.sort_by(fn item -> item[:value] end)
  # end
end
