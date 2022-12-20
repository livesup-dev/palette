defmodule Palette.Components.FooterScripts do
  use Phoenix.Component

  def eq_footer_scripts(assigns) do
    ~H"""
    <!-- plugin for scrollbar  -->
    <script src="/js/plugins/perfect-scrollbar.min.js" async>
    </script>
    <!-- github button -->
    <script async defer src="https://buttons.github.io/buttons.js">
    </script>
    <script type="text/javascript" src="/js/plugins/chartjs.min.js">
    </script>
    <script type="text/javascript" src="/js/chart-1.js">
    </script>
    <script type="text/javascript" src="/js/chart-2.js">
    </script>
    <script type="text/javascript" src="/js/perfect-scrollbar.js">
    </script>
    <script type="text/javascript" src="/js/nav-pills.js">
    </script>
    <script type="text/javascript" src="/js/tooltips.js">
    </script>
    <script type="text/javascript" src="/js/dropdown.js">
    </script>
    <script type="text/javascript" src="/js/navbar-sticky.js">
    </script>
    """
  end
end
