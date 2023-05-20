defmodule Palette.Components.FavoriteTest do
  use ExUnit.Case, async: true
  import Palette.Components.Favorite
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: []])

  describe "favorite/1" do
    test "favorite/1 will render properly", %{assigns: assigns} do
      h = ~H(<.favorite />)
      assert rendered_to_string(h) =~ ~s(<i class=\"fa-regular fa-star fa-xl\"></i>)
    end
  end
end
