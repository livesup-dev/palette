defmodule Palette.Components.Live.GlobalSearch do
  use Phoenix.LiveComponent
  alias Phoenix.LiveView.JS
  alias Phoenix.LiveView.TagEngine

  @impl true
  def update(assigns, socket) do
    socket =
      socket
      |> assign(assigns)
      |> assign_new(:results, fn -> [] end)

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    assigns =
      assigns
      |> assign_new(:display_popper, fn -> true end)

    ~H"""
    <div>
      <div class="block max-w-xs flex-auto">
        <button
          type="button"
          class="hidden text-slate-500 hover:ring-slate-300 ring-slate-300 h-8 w-full items-center gap-2 rounded-md pl-2 pr-3 text-sm ring-1 transition lg:flex focus:[&:not(:focus-visible)]:outline-none dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
          phx-click={open_modal()}
        >
          <svg viewBox="0 0 20 20" fill="none" aria-hidden="true" class="h-5 w-5 stroke-current">
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M12.01 12a4.25 4.25 0 1 0-6.02-6 4.25 4.25 0 0 0 6.02 6Zm0 0 3.24 3.25"
            >
            </path>
          </svg>
          Search...
        </button>
      </div>

      <div
        id="searchbar-dialog"
        class="hidden absolute h-screen inset-0 z-50"
        role="dialog"
        aria-modal="true"
        phx-window-keydown={hide_modal()}
        phx-key="escape"
      >
        <div class="absolute inset-0 bg-slate-400/25 opacity-100"></div>
        <div class="absolute inset-0 overflow-y-auto px-4 py-4 sm:py-20 sm:px-6 md:py-32 lg:px-8 lg:py-[15vh]">
          <div
            id="searchbox_container"
            class="mx-auto overflow-hidden rounded-lg bg-slate-50 shadow-xl ring-slate-900/7.5 sm:max-w-2xl opacity-100 scale-100"
          >
            <div
              role="combobox"
              aria-haspopup="listbox"
              phx-click-away={hide_modal()}
              aria-expanded={@results != []}
            >
              <form action="" novalidate="" role="search" phx-change="search" phx-target={@myself}>
                <div class="group relative flex h-12">
                  <svg
                    viewBox="0 0 20 20"
                    fill="none"
                    aria-hidden="true"
                    class="pointer-events-none absolute left-3 top-0 h-full w-5 stroke-slate-500 z-1 dark:stroke-white"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M12.01 12a4.25 4.25 0 1 0-6.02-6 4.25 4.25 0 0 0 6.02 6Zm0 0 3.24 3.25"
                    >
                    </path>
                  </svg>

                  <input
                    id="search-input"
                    name="search[query]"
                    class="form-input flex-auto rounded-lg appearance-none bg-transparent pl-9 text-slate-500 outline-none focus:outline-none border-slate-300 focus:border-primary focus:ring-0 focus:shadow-none hover:border-slate-400 placeholder:text-slate-400 focus:w-full focus:flex-none sm:text-sm [&::-webkit-search-cancel-button]:hidden [&::-webkit-search-decoration]:hidden [&::-webkit-search-results-button]:hidden [&::-webkit-search-results-decoration]:hidden pr-4 dark:text-white dark:bg-navy-400 dark:border-navy-450 dark:hover:border-navy-400 dark:focus:border-accent"
                    style={
                      @results != [] &&
                        "border-bottom-left-radius: 0; border-bottom-right-radius: 0; border-bottom: none"
                    }
                    aria-autocomplete="both"
                    aria-controls="searchbox__results_list"
                    autocomplete="off"
                    autocorrect="off"
                    autocapitalize="off"
                    enterkeyhint="search"
                    spellcheck="false"
                    placeholder="Search..."
                    type="search"
                    value=""
                    tabindex="0"
                    phx-debounce="500"
                    phx-target={@myself}
                  />
                </div>
                <div :if={@results != []} class="card px-4 pb-4 pt-4">
                  <div class="max-h-96 overflow-auto">
                    <%= for result <- @results do %>
                      <%= TagEngine.component(
                        &result[:row_component].render/1,
                        [row: result[:row]],
                        {__ENV__.module, __ENV__.function, __ENV__.file, __ENV__.line}
                      ) %>
                    <% end %>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event(
        "search",
        %{"search" => %{"query" => query}},
        %{assigns: %{search_module: search_module}} = socket
      ) do
    # pid = self()
    # send_update(GlobalSearch, id: "global-search", results: search(query))

    {:noreply, socket |> assign(:results, search_module.search(query))}
  end

  def open_modal(js \\ %JS{}) do
    js
    |> JS.show(
      to: "#searchbox_container",
      transition:
        {"transition ease-out duration-200", "opacity-0 scale-95", "opacity-100 scale-100"}
    )
    |> JS.show(
      to: "#searchbar-dialog",
      transition: {"transition ease-in duration-100", "opacity-0", "opacity-100"}
    )
    |> JS.focus(to: "#search-input")
  end

  def hide_modal(js \\ %JS{}) do
    js
    |> JS.hide(
      to: "#searchbar-searchbox_container",
      transition:
        {"transition ease-in duration-100", "opacity-100 scale-100", "opacity-0 scale-95"}
    )
    |> JS.hide(
      to: "#searchbar-dialog",
      transition: {"transition ease-in duration-100", "opacity-100", "opacity-0"}
    )
  end
end
