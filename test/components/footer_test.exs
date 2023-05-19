defmodule Palette.Components.FooterTest do
  # Import ExUnit.Case module
  use ExUnit.Case

  @tag :footer
  test "eq_footer renders correctly" do
    assigns = %{made_by: "John Doe", link: "https://example.com"}

    {:ok, _, liveview} = live(Palette.Components.Footer, assigns)

    assert %Phoenix.LiveView.Rendered{html: html} = liveview |> rendered()
    assert html =~ "made with <i class=\"fa fa-heart\"></i>"

    assert html =~
             "by <a href=\"https://example.com\" class=\"font-semibold text-slate-700\">John Doe</a>"
  end
end
