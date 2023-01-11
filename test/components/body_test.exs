defmodule Palette.Components.BodyTest do
  use ExUnit.Case, async: true

  import Palette.Components.Body
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: %{}])

  describe "body/1" do
    test "body will be render properly", %{assigns: assigns} do
      h = ~H(<.body>
  <h1>Testing</h1>
</.body>)
      assert rendered_to_string(h) =~ ~s(Testing)
    end
  end
end
