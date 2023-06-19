defmodule Palette.Components.Button do
  use Phoenix.Component

  attr(:label, :string, default: "Save")
  attr(:in_progress_label, :string, default: "Saving...")
  attr(:class, :string, default: "")
  attr(:disabled, :boolean, default: false)
  attr(:type, :atom, default: :submit, values: [:button, :submit, :reset])
  attr(:left_icon, :string, default: nil)
  attr(:right_icon, :string, default: nil)
  attr(:rest, :global)

  attr(:color, :atom,
    default: :default,
    values: [:default, :primary, :secondary, :info, :success, :warning, :error]
  )

  def button(%{color: color, class: custom_class, disabled: disabled} = assigns) do
    full_class = "#{class(color, disabled)} #{custom_class}"

    assigns =
      assigns
      |> assign(:class, full_class)

    ~H"""
    <button type={@type} phx-disable-with="" disabled={@disabled} class={@class} {@rest}>
      <svg
        role="status"
        class="while-submitting inline mr-3 w-4 h-4 text-white animate-spin"
        viewBox="0 0 100 101"
        fill="none"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
          fill="#E5E7EB"
        />
        <path
          d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
          fill="currentColor"
        />
      </svg>
      <i :if={@left_icon} class={"w-5 #{@left_icon}"}></i>
      <span class="inner-text"><%= @label %></span>
      <i :if={@right_icon} class={"w-5 #{@right_icon}"}></i>
      <span class="while-submitting"><%= @in_progress_label %></span>
    </button>
    """
  end

  # Enable classes
  defp class(:default, false = _disabled),
    do:
      "btn bg-slate-150 font-medium text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90"

  defp class(:primary, false = _disabled),
    do:
      "btn bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90"

  defp class(:secondary, false = _disabled),
    do:
      "btn bg-secondary font-medium text-white hover:bg-secondary-focus focus:bg-secondary-focus active:bg-secondary-focus/90 disabled:pointer-events-none disabled:select-none disabled:opacity-60"

  defp class(:info, false = _disabled),
    do:
      "btn bg-info font-medium text-white hover:bg-info-focus focus:bg-info-focus active:bg-info-focus/90"

  defp class(:success, false = _disabled),
    do:
      "btn bg-success font-medium text-white hover:bg-success-focus focus:bg-success-focus active:bg-success-focus/90"

  defp class(:warning, false = _disabled),
    do:
      "btn bg-warning font-medium text-white hover:bg-warning-focus focus:bg-warning-focus active:bg-warning-focus/90"

  defp class(:error, false = _disabled),
    do:
      "btn bg-error font-medium text-white hover:bg-error-focus focus:bg-error-focus active:bg-error-focus/90"

  # Disabled classes
  defp class(:default, true = _disabled),
    do:
      "btn bg-slate-150 font-medium text-slate-800 hover:bg-slate-200 focus:bg-slate-200 active:bg-slate-200/80 disabled:pointer-events-none disabled:select-none disabled:opacity-60 dark:bg-navy-500 dark:text-navy-50 dark:hover:bg-navy-450 dark:focus:bg-navy-450 dark:active:bg-navy-450/90"

  defp class(:primary, true = _disabled),
    do:
      "btn bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 disabled:pointer-events-none disabled:select-none disabled:opacity-60 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90"

  defp class(:secondary, true = _disabled),
    do:
      "btn bg-secondary font-medium text-white hover:bg-secondary-focus focus:bg-secondary-focus active:bg-secondary-focus/90 disabled:pointer-events-none disabled:select-none disabled:opacity-60"

  defp class(:info, true = _disabled),
    do:
      "btn bg-info font-medium text-white hover:bg-info-focus focus:bg-info-focus active:bg-info-focus/90 disabled:pointer-events-none disabled:select-none disabled:opacity-60"

  defp class(:success, true = _disabled),
    do:
      "btn bg-success font-medium text-white hover:bg-success-focus focus:bg-success-focus active:bg-success-focus/90 disabled:pointer-events-none disabled:select-none disabled:opacity-60"

  defp class(:warning, true = _disabled),
    do:
      "btn bg-warning font-medium text-white hover:bg-warning-focus focus:bg-warning-focus active:bg-warning-focus/90 disabled:pointer-events-none disabled:select-none disabled:opacity-60"

  defp class(:error, true = _disabled),
    do:
      "btn bg-error font-medium text-white hover:bg-error-focus focus:bg-error-focus active:bg-error-focus/90 disabled:pointer-events-none disabled:select-none disabled:opacity-60"
end
