defmodule Palette.Components.Preloader do
  use Phoenix.Component

  def preloader(assigns) do
    ~H"""
    <div class="app-preloader fixed z-50 grid h-full w-full place-content-center bg-slate-50 dark:bg-navy-900">
      <div class="app-preloader-inner relative inline-block h-48 w-48"></div>
    </div>
    """
  end
end
