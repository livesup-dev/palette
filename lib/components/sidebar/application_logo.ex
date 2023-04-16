defmodule Palette.Components.Sidebar.ApplicationLogo do
  use Phoenix.Component

  attr(:logo, :string, default: nil)
  attr(:path, :string, default: "/")

  def application_logo(assigns) do
    ~H"""
    <div class="flex pt-4">
      <a href={@path}>
        <img
          class="w-10 transition-transform duration-500 ease-in-out hover:rotate-[360deg]"
          src={@logo}
          alt="logo"
        />
      </a>
    </div>
    """
  end
end
