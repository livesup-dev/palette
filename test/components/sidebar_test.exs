defmodule Palette.Components.Sidebar.MainTest do
  use ExUnit.Case, async: true

  import Palette.Components.Sidebar.{Main, MainItem}
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: %{}])

  describe "sidebar_main/1" do
    @tag :sidebar_main
    test "sidebar will be render properly", %{assigns: assigns} do
      h = ~H(<.sidebar_main logo="/images/logo.png">
  <.sidebar_main_item label="Dashboard" path="/dashboard" icon="fa-house" />
  <.sidebar_main_item label="Test" path="/test" icon="fa-house" />
</.sidebar_main>)
      assert rendered_to_string(h) =~ ~s(src=\"/images/logo.png\")
    end
  end
end
