defmodule Palette.Components.SwitchTest do
  use ExUnit.Case, async: true

  import Palette.Components.Switch
  import Phoenix.Component, only: [sigil_H: 2]
  import Phoenix.LiveViewTest, only: [rendered_to_string: 1]

  setup(do: [assigns: %{}])

  describe "switch/1" do
    @describetag :switch
    test "switch will be rendered properly with default color", %{assigns: assigns} do
      h = ~H(<.switch label="test" name="test" />)

      assert rendered_to_string(h) ==
               "<label for=\"test\" class=\"inline-flex items-center space-x-2\">\n  <input type=\"checkbox\" name=\"test\" id=\"test\" class=\"form-switch h-5 w-10 rounded-full bg-slate-300 before:rounded-full before:bg-slate-50 checked:bg-slate-500 checked:before:bg-white dark:bg-navy-900 dark:before:bg-navy-300 dark:checked:bg-navy-400 dark:checked:before:bg-white \">\n  <span>test</span>\n  \n</label>"
    end
  end
end
