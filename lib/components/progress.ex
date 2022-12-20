defmodule Palette.Components.Progress do
  use Phoenix.Component

  def progress(assigns) do
    ~H"""
    <div class="progress h-1 bg-slate-150 dark:bg-navy-500">
      <div class="is-indeterminate relative w-4/12 rounded-full bg-slate-500 dark:bg-navy-400"></div>
    </div>
    """
  end
end
