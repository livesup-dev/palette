defmodule Palette.Components.PageHeader do
  use Phoenix.Component
  use Phoenix.HTML
  alias Palette.Components.Breadcrumb

  attr(:breadcrumb, :list, required: true)
  attr(:title, :string, required: true)
  attr(:search_title, :string)
  attr(:show_search, :boolean, default: true)
  attr(:show_actions, :boolean, default: true)
  attr(:show_title, :boolean, default: true)

  slot :action, doc: "Add action" do
    attr(:label, :string, required: true)
    attr(:path, :string, required: true)
    attr(:icon, :string, required: true)
  end

  def eq_page_hader(assigns) do
    ~H"""
    <div class="block justify-between items-center p-4 mt-2 mb-3 bg-white rounded-2xl shadow-md shadow-gray-200 lg:p-5 sm:flex">
      <div class="mb-1 w-full">
        <div class="mb-4">
          <Breadcrumb.breadcrumb steps={@breadcrumb} title={@title} />
          <%!-- <%= if @show_title do %>
            <h1 class="text-xl font-semibold text-gray-900 sm:text-2xl"><%= @title %></h1>
          <% end %> --%>
        </div>
        <div class="sm:flex">
          <%= if @show_search do %>
            <div class="items-center mb-3 sm:flex sm:divide-x sm:divide-gray-100 sm:mb-0">
              <div class="lg:pr-3">
                <label for="users-search" class="sr-only">Search</label>
                <div class="relative mt-1 lg:w-64 xl:w-96">
                  <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                    <svg
                      class="w-5 h-5 text-gray-500 dark:text-gray-400"
                      fill="currentColor"
                      viewBox="0 0 20 20"
                      xmlns="http://www.w3.org/2000/svg"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                        clip-rule="evenodd"
                      >
                      </path>
                    </svg>
                  </div>
                  <input
                    type="text"
                    id="table-search"
                    class="border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-2 focus:ring-fuchsia-50 focus:border-fuchsia-300 block w-full p-2.5 pl-10"
                    placeholder={@search_title}
                    id="search-input"
                    autocomplete="off"
                    phx-keyup="search"
                    phx-debounce="500"
                  />
                </div>
              </div>
            </div>
          <% end %>
          <%= if @show_actions do %>
            <div class="flex items-center ml-auto space-x-2 sm:space-x-3">
              <%= for action <- @action do %>
                <.link
                  patch={action.path}
                  class="inline-flex justify-center items-center py-2 px-3 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 hover:scale-[1.02] transition-transform sm:w-auto"
                >
                  <%= raw(action.icon) %>
                  <%= action.label %>
                </.link>
              <% end %>
            </div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end
