defmodule Palette.Components.SignIn do
  use Phoenix.Component

  attr(:title, :string, required: true)
  attr(:error, :string, default: nil)
  attr(:oauth_path, :string, required: true)
  attr(:footer, :boolean, default: true)

  def sign_in(assigns) do
    ~H"""
    <main class="grid w-full grow grid-cols-1 place-items-center">
      <div class="w-full max-w-[26rem] p-4 sm:px-5">
        <div class="text-center">
          <img class="mx-auto h-16 w-24" src="/images/logo-300.png" alt="logo" />
          <div class="mt-4">
            <h2 class="text-2xl font-semibold text-slate-600 dark:text-navy-100">
              <%= @title %>
            </h2>
            <p class="text-slate-400 dark:text-navy-300">
              Please sign in to continue
            </p>
            <p :if={@error} class="alert alert-danger" role="alert"><%= @error %></p>
          </div>
        </div>
        <div class="card mt-5 rounded-lg p-5 lg:p-7">
          <.link
            href={@oauth_path}
            class="btn mt-5 w-full bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90"
          >
            Sign In
          </.link>
          <div :if={@footer} class="mt-4 text-center text-xs+">
            <p class="line-clamp-1">
              <span>Looking for other app?</span>

              <a
                target="_blank"
                class="text-primary transition-colors hover:text-primary-focus dark:text-accent-light dark:hover:text-accent"
                href={Palette.Config.catalog_url()}
              >
                Explore the catalog
              </a>
            </p>
          </div>
        </div>
      </div>
    </main>
    """
  end
end
