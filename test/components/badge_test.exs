defmodule Palette.Components.BadgeTest do
  use ExUnit.Case, async: true

  import Palette.Components.Badges.Badge
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: %{description: "Testing"}])

  describe "badge/1" do
    test "badge will be render properly", %{assigns: assigns} do
      h = ~H(<.badge description={@description} />)
      assert rendered_to_string(h) =~ ~s(>Testing<)
    end
  end
end
