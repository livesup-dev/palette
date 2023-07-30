defmodule Palette.Components.InitalAvatarTest do
  use ExUnit.Case, async: true

  import Palette.Components.Avatars.InitialAvatar
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: %{}])

  describe "initial avatar/1" do
    @describetag :initial_avatar
    test "initial avatar will be rendered properly with default type", %{assigns: assigns} do
      h = ~H(<.initial_avatar text="EJ" />)

      assert rendered_to_string(h) ==
               "<div class=\"avatar h-8 w-8 \">\n  <div class=\"is-initial rounded-full bg-slate-200 text-base uppercase text-slate-600 dark:bg-navy-500 dark:text-navy-100\">\n    EJ\n  </div>\n</div>"
    end

    test "initial avatar will be rendered properly with different size", %{assigns: assigns} do
      h = ~H(<.initial_avatar text="EJ" size="12" />)

      assert rendered_to_string(h) ==
               "<div class=\"avatar h-12 w-12 \">\n  <div class=\"is-initial rounded-full bg-slate-200 text-base uppercase text-slate-600 dark:bg-navy-500 dark:text-navy-100\">\n    EJ\n  </div>\n</div>"
    end

    test "initial avatar will be rendered properly with different size and type", %{
      assigns: assigns
    } do
      h = ~H(<.initial_avatar text="EJ" size="12" type={:soft} />)

      assert rendered_to_string(h) ==
               "<div class=\"avatar h-12 w-12 \">\n  <div class=\"is-initial rounded-full bg-slate-200/10 text-base uppercase text-slate-600 dark:bg-navy-500/10 dark:text-navy-100\">\n    EJ\n  </div>\n</div>"
    end
  end
end
