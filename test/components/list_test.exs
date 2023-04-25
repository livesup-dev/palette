defmodule Palette.Components.ListTest do
  use ExUnit.Case, async: true

  import Palette.Components.List
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: %{description: "Testing", color: :success}])

  describe "list/1" do
    @describetag :list
    test "show a list", %{assigns: assigns} do
      h = ~H(<.list>
  <:item title="Description">Hola</:item>
  <:item title="Code">Chau</:item>
</.list>)

      assert rendered_to_string(h) =~ ~s(>Hola<)
    end
  end
end
