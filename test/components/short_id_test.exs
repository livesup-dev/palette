defmodule Palette.Components.ShortIdTest do
  use ExUnit.Case, async: true

  import Palette.Components.ShortId
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: []])

  describe "short_id/1" do
    test "short_id will be render properly", %{assigns: assigns} do
      h = ~H(<.short_id value="d3879b86-bf97-4e8a-8e0f-66a6f7cf9371" />)
      assert rendered_to_string(h) =~ ~s(<span>d3879b86</span>)
    end
  end
end
