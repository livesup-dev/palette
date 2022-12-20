defmodule Palette.Components.BreadcrumbTest do
  use ExUnit.Case, async: true

  import Palette.Components.Breadcrumb
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  alias Palette.Components.Breadcrumb.Step

  setup(do: [assigns: %{steps: [%Step{label: "Home"}, %Step{label: "Another"}]}])

  describe "breadcrumb/1" do
    test "breadcrumb will be render properly", %{assigns: assigns} do
      h = ~H(<.breadcrumb title="Testing" steps={@steps} />)
      assert rendered_to_string(h) =~ ~s(>Another<)
    end
  end
end
