defmodule Palette.Components.FromNowTest do
  use ExUnit.Case, async: true

  import Palette.Components.FromNow
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: []])

  describe "from_now/1" do
    test "from_now will be render properly", %{assigns: assigns} do
      h = ~H(<.from_now value="2016-02-29T12:30:30.120+00:00" />)
      assert rendered_to_string(h) =~ ~s(ago<)
    end
  end
end
