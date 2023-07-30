defmodule Palette.Components.AvatarTest do
  use ExUnit.Case, async: true

  import Palette.Components.Avatars.Avatar
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: %{}])

  describe "avatar/1" do
    @describetag :avatar
    test "avatar will be rendered properly with default type", %{assigns: assigns} do
      h = ~H(<.avatar img="/img/avatar.jpg" />)

      assert rendered_to_string(h) ==
               "<div class=\"avatar h-8 w-8 \">\n  <img class=\"rounded-full\" src=\"/img/avatar.jpg\" alt=\"avatar\">\n</div>"
    end

    test "avatar will be rendered properly with square type", %{assigns: assigns} do
      h = ~H(<.avatar type={:square} img="/img/avatar.jpg" />)

      assert rendered_to_string(h) ==
               "<div class=\"avatar h-8 w-8 \">\n  <img class=\"rounded-lg\" src=\"/img/avatar.jpg\" alt=\"avatar\">\n</div>"
    end

    test "avatar will be rendered properly with squircle type", %{assigns: assigns} do
      h = ~H(<.avatar type={:squircle} img="/img/avatar.jpg" size="10" />)

      assert rendered_to_string(h) ==
               "<div class=\"avatar h-10 w-10 \">\n  <img class=\"mask is-squircle\" src=\"/img/avatar.jpg\" alt=\"avatar\">\n</div>"
    end
  end
end
