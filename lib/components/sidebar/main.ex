defmodule Palette.Components.Sidebar.Main do
  use Phoenix.Component
  alias Palette.Components.{SidebarProfile, SettingButton}
  import Palette.Components.Sidebar.ApplicationLogo

  attr(:logo, :string, required: true)
  attr(:logout_path, :string, default: "/logout")
  attr(:profile_path, :string, default: "/profile")
  attr(:user, :map, default: nil)
  slot(:inner_block, required: true)

  def sidebar_main(assigns) do
    assigns =
      assigns
      |> assign(:setting_button, false)

    ~H"""
    <div class="main-sidebar">
      <div class="flex h-full w-full flex-col items-center border-r border-slate-150 bg-white dark:border-navy-700 dark:bg-navy-800">
        <!-- Application Logo -->
        <.application_logo logo={@logo} />
        <!-- Main Sections Links -->
        <div class="is-scrollbar-hidden flex grow flex-col space-y-4 overflow-y-auto pt-6">
          <%= render_slot(@inner_block) %>
        </div>
        <!-- Bottom Links -->
        <div class="flex flex-col items-center space-y-3 py-3">
          <SettingButton.setting_button :if={@setting_button} />
          <SidebarProfile.sidebar_profile :if={@user} logout_path={@logout_path} user={@user} />
        </div>
      </div>
    </div>
    """
  end
end
