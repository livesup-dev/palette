defmodule Palette.Components.AlertTest do
  use ExUnit.Case, async: true

  import Palette.Components.Alert
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: %{description: "Testing", color: :success}])

  describe "alert/1" do
    @describetag :alert
    test "alert will be rendered properly with default color", %{assigns: assigns} do
      h = ~H(<.alert description={@description} />)
      assert rendered_to_string(h) =~ ~s(>Testing<)
    end

    test "alert will be rendered properly with custom color and class", %{assigns: assigns} do
      assigns = %{description: "Testing", color: :info, class: "custom-class"}

      h = ~H(<.alert description={@description} color={@color} class={@class} />)
      assert rendered_to_string(h) =~ ~s(>Testing<)

      assert rendered_to_string(h) =~
               ~r/class="custom-class alert flex rounded-lg bg-info px-4 py-4 text-white sm:px-5"/
    end
  end
end
