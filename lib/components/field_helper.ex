defmodule Palette.Components.FieldHelper do
  import Phoenix.Component

  def assign_basic_attrs(%{field: nil} = assigns) do
    with %{value: %Phoenix.HTML.FormField{} = field} <- assigns do
      assigns
      |> assign(:name, field.name)
      |> assign(:value, field.value)
      |> assign(:errors, field.errors)
    end
  end

  def assign_basic_attrs(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
    assigns
    |> assign(:name, field.name)
    |> assign(:value, field.value)
    |> assign(:errors, field.errors)
  end
end
