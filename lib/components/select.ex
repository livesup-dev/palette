defmodule Palette.Components.Select do
  use Phoenix.Component
  import Phoenix.HTML
  import Palette.Components.FieldHelper

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
  attr(:type, :atom, default: :default, values: [:default, :rounded])
  attr(:value, :any, default: nil)
  attr(:field, Phoenix.HTML.FormField, default: nil)
  attr(:label, :string, default: nil)
  attr(:required, :boolean, default: false)
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

    assigns
    |> assign(:options, options)
    |> _do_select()
  end

  def _do_select(assigns) do
    assigns = assigns |> assign_basic_attrs() |> assign(:type_class, type_class(assigns.type))

    ~H"""
    <div phx-feedback-for={@name}>
      <span><%= @label %><span :if={@required} class="ml-1">*</span></span>
      <select
        id={@id}
        name={@name}
        class={"form-select mt-1.5 w-full #{@type_class} border border-slate-300 bg-white px-3 py-2 hover:border-slate-400 focus:border-primary dark:border-navy-450 dark:bg-navy-700 dark:hover:border-navy-400 dark:focus:border-accent"}
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

  defp type_class(:default), do: "rounded-lg"
  defp type_class(:rounded), do: "rounded-full"
end
