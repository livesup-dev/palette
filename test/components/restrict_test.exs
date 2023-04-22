defmodule Palette.Components.RestrictTest do
  use ExUnit.Case, async: true

  import Palette.Components.Restrict
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  describe "restrict/1" do
    @describetag :restrict
    test "restrict will be rendered content when permission is available" do
      assigns = %{permission: "write", permissions: ["read", "write"]}

      h = ~H(<.restrict permission="write" permissions={@permissions}>hello content</.restrict>)

      assert rendered_to_string(h) =~ ~s(hello content)
    end

    test "restrict will be not rendered content when permission is not available" do
      assigns = %{permission: "write", permissions: ["read"]}

      h =
        ~H(<.restrict permission={@permission} permissions={@permissions}>hello content</.restrict>)

      assert rendered_to_string(h) == ""
    end
  end
end
