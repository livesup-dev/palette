defmodule Palette.Components.Sidebar.Main do
  use Phoenix.Component
  alias Palette.Components.{SidebarProfile, SettingButton}

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
        <div class="flex pt-4">
          <a href="/">
            <img
              class="w-10 transition-transform duration-500 ease-in-out hover:rotate-[360deg]"
              src={@logo}
              alt="logo"
            />
          </a>
        </div>
        <!-- Main Sections Links -->
        <div class="is-scrollbar-hidden flex grow flex-col space-y-4 overflow-y-auto pt-6">
          <a
            href="/"
            class="flex h-11 w-11 items-center justify-center rounded-lg bg-primary/10 outline-none transition-colors duration-200 hover:bg-primary/20 focus:bg-primary/20 active:bg-primary/25 dark:bg-navy-600 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90"
            x-tooltip.placement.right="'Home'"
          >
            <svg class="h-7 w-7" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path
                d="M5 14.0585C5 13.0494 5 12.5448 5.22166 12.1141C5.44333 11.6833 5.8539 11.3901 6.67505 10.8035L10.8375 7.83034C11.3989 7.42938 11.6795 7.2289 12 7.2289C12.3205 7.2289 12.6011 7.42938 13.1625 7.83034L17.325 10.8035C18.1461 11.3901 18.5567 11.6833 18.7783 12.1141C19 12.5448 19 13.0494 19 14.0585V19C19 19.9428 19 20.4142 18.7071 20.7071C18.4142 21 17.9428 21 17 21H7C6.05719 21 5.58579 21 5.29289 20.7071C5 20.4142 5 19.9428 5 19V14.0585Z"
                fill-opacity="0.3"
                class="fill-primary dark:fill-accent"
              />
              <path
                d="M3 12.3866C3 12.6535 3 12.7869 3.0841 12.8281C3.16819 12.8692 3.27352 12.7873 3.48418 12.6234L10.7721 6.95502C11.362 6.49625 11.6569 6.26686 12 6.26686C12.3431 6.26686 12.638 6.49625 13.2279 6.95502L20.5158 12.6234C20.7265 12.7873 20.8318 12.8692 20.9159 12.8281C21 12.7869 21 12.6535 21 12.3866V11.9782C21 11.4978 21 11.2576 20.8983 11.0497C20.7966 10.8418 20.607 10.6944 20.2279 10.3995L13.2279 4.95502C12.638 4.49625 12.3431 4.26686 12 4.26686C11.6569 4.26686 11.362 4.49625 10.7721 4.95502L3.77212 10.3995C3.39295 10.6944 3.20337 10.8418 3.10168 11.0497C3 11.2576 3 11.4978 3 11.9782V12.3866Z"
                class="fill-primary dark:fill-accent"
              />
              <path
                d="M12.5 15H11.5C10.3954 15 9.5 15.8954 9.5 17V20.85C9.5 20.9328 9.56716 21 9.65 21H14.35C14.4328 21 14.5 20.9328 14.5 20.85V17C14.5 15.8954 13.6046 15 12.5 15Z"
                class="fill-primary dark:fill-accent"
              />
              <rect x="16" y="5" width="2" height="4" rx="0.5" class="fill-primary dark:fill-accent" />
            </svg>
          </a>
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
