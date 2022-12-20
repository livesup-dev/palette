defmodule Palette.Components.Sidebar.Panel do
  use Phoenix.Component

  slot(:inner_block, required: true)

  def sidebar_panel(assigns) do
    assigns =
      assigns
      |> assign_new(:title, fn -> "Home" end)

    ~H"""
    <div class="sidebar-panel">
      <div class="flex h-full grow flex-col bg-white pl-[var(--main-sidebar-width)] dark:bg-navy-750">
        <!-- Sidebar Panel Header -->
        <div class="flex h-18 w-full items-center justify-between pl-4 pr-1">
          <p class="text-base tracking-wider text-slate-800 dark:text-navy-100">
            <%= @title %>
          </p>
          <button
            @click="$store.global.isSidebarExpanded = false"
            class="btn h-7 w-7 rounded-full p-0 text-primary hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:text-accent-light/80 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25 xl:hidden"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              class="h-6 w-6"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M15 19l-7-7 7-7"
              />
            </svg>
          </button>
        </div>
        <!-- Sidebar Panel Body -->
        <div
          x-data="{expandedItem:null}"
          class="h-[calc(100%-4.5rem)] overflow-x-hidden pb-6"
          x-init="$el._x_simplebar = new SimpleBar($el);"
        >
          <ul class="flex flex-1 flex-col px-4 font-inter">
            <%= render_slot(@inner_block) %>
          </ul>
        </div>
      </div>
    </div>
    """
  end
end
