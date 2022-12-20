defmodule Palette.Components.TableTest do
  use ExUnit.Case, async: true

  import Palette.Components.Table
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: []])

  describe "table/1" do
    @describetag :table

    test "table will be render properly", %{assigns: assigns} do
      h = ~H(<.table rows={[
  %{city: "Paris", first_name: "Jean", last_name: "Dupont"},
  %{city: "NY", first_name: "Sam", last_name: "Smith"}
]}>
  <:col :let={user} label="First name">
    <%= user.first_name %>
  </:col>
  <:col :let={user} label="Last name">
    <%= user.last_name %>
  </:col>
  <:col :let={user} label="City">
    <%= user.city %>
  </:col>
</.table>)
      content = rendered_to_string(h)
      assert content =~ ~s(First name)
      assert content =~ ~s(Last name)
      assert content =~ ~s(City)
    end
  end
end
