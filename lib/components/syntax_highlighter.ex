defmodule Palette.Components.SyntaxHighlighter do
  use Phoenix.Component
  import Phoenix.HTML

  attr(:code, :string, default: nil)
  attr(:style, :atom, default: :default, values: [:default, :diff])

  def syntax_highlight(assigns) do
    ~H"""
    <div class="mb-4 border">
      <%= raw(highlight(@code)) %>
    </div>
    """
  end

  defp highlight(code) do
    Makeup.highlight(code)
  end

  def syntax_highlight_css(), do: syntax_highlight_css(:default)

  def syntax_highlight_css(:default) do
    Makeup.Styles.HTML.StyleMap.default_style()
    |> Makeup.stylesheet()
  end

  def syntax_highlight_css(:diff) do
    Makeup.Styles.HTML.StyleMap.abap_style()
    |> Makeup.stylesheet()
  end
end
