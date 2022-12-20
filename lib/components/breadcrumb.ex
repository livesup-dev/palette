defmodule Palette.Components.Breadcrumb do
  use Phoenix.Component

  defmodule Step do
    defstruct [:label, :path]
  end

  attr(:title, :string, required: true)
  attr(:steps, :list, required: true)

  slot(:actions, doc: "Add action")

  def breadcrumb(assigns) do
    {last, steps} =
      assigns[:steps]
      |> List.pop_at(-1)

    assigns
    |> assign(:last, last)
    |> assign(:steps, steps)
    |> render()
  end

  defp render(assigns) do
    ~H"""
    <div class="flex items-center justify-between py-5 lg:py-6">
      <div class="flex items-center space-x-1">
        <h2 class="text-xl font-medium text-slate-800 dark:text-navy-50 lg:text-2xl">
          <%= @title %>
        </h2>
        <div class="hidden h-full py-1 sm:flex">
          <div class="h-full w-px bg-slate-300 dark:bg-navy-600"></div>
        </div>
        <ul class="hidden flex-wrap items-center space-x-2 sm:flex">
          <li :for={step <- @steps} class="flex items-center space-x-2">
            <.link
              :if={step.path}
              class="text-primary transition-colors hover:text-primary-focus dark:text-accent-light dark:hover:text-accent"
              navigate={step.path}
            >
              <%= step.label %>
            </.link>

            <span :if={is_nil(step.path)}><%= step.label %></span>

            <svg
              x-ignore
              xmlns="http://www.w3.org/2000/svg"
              class="h-4 w-4"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
            </svg>
          </li>
          <li><%= @last.label %></li>
        </ul>
      </div>

      <div class="flex items-center space-x-2">
        <div class="flex">
          <%= render_slot(@actions) %>
        </div>
      </div>
    </div>
    """
  end
end
