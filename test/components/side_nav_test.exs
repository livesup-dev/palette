defmodule Palette.Components.SideNavTest do
  use ExUnit.Case, async: true

  import Palette.Components.SideNav
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: []])

  describe "eq_sidenav/1" do
    @describetag :sidenav

    test "sidenav will be render properly", %{assigns: assigns} do
      h = ~H(<.eq_sidenav>
  <.eq_sidenav_group label="Option 1">
    <.eq_sidenav_item label="Option 1.1" path="/option-1-1" />
    <.eq_sidenav_item label="Option 1.2" path="/option-1-2" />
  </.eq_sidenav_group>
  <.eq_sidenav_group label="Option 2">
    <.eq_sidenav_item label="Option 2.1" path="/option-2-1" />
    <.eq_sidenav_item label="Option 2.2" path="/option-2-2" />
  </.eq_sidenav_group>
</.eq_sidenav>)
      content = rendered_to_string(h)
      assert content =~ ~s(>Option 1<)
      assert content =~ ~s(>Option 2<)
      assert content =~ ~s(>Option 1.1<)
      assert content =~ ~s(>Option 1.2<)
      assert content =~ ~s(>Option 2.1<)
      assert content =~ ~s(>Option 2.2<)
    end
  end
end
