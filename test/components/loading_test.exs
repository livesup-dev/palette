defmodule Palette.Components.LoadingTest do
  use ExUnit.Case, async: true

  import Palette.Components.Loading
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: []])

  describe "loading/1" do
    test "loading/1 will render properly", %{assigns: assigns} do
      h = ~H(<.loading />)
      assert rendered_to_string(h) =~ ~s(<div class=\"text-center\">)
    end
  end
end
