defmodule Palette.Components.Modal do
  use Phoenix.Component
  # import Phoenix.LiveView.Helpers

  alias Phoenix.LiveView.JS
  alias Palette.Components.Icon

  @doc """
  Renders a modal.

  ## Examples

      <.modal id="confirm-modal">
        This is a modal.
      </.modal>

  JS commands may be passed to the `:on_cancel` to configure
  the closing/cancel event, for example:

      <.modal id="confirm" on_cancel={JS.navigate(~p"/posts")}>
        This is another modal.
      </.modal>

  """
  attr(:id, :string, default: "modal")
  attr(:title, :string, required: true)
  attr(:show, :boolean, default: false)
  attr(:on_cancel, JS, default: %JS{})
  attr(:width, :atom, default: :small, values: [:small, :medium, :large])
  attr(:return_to, :string, default: nil)
  slot(:inner_block, required: true)

  def modal(assigns) do
    assigns =
      assigns
      |> assign(:on_cancel, on_cancel(assigns))
      |> assign_width_class()

    ~H"""
    <div
      id={@id}
      phx-mounted={@show && show_modal(@id)}
      phx-remove={hide_modal(@id)}
      data-cancel={JS.exec(@on_cancel, "phx-remove")}
      class="fixed inset-0 z-[100] flex flex-col items-center justify-center overflow-hidden px-4 py-6 sm:px-5"
    >
      <div
        id={"#{@id}-bg"}
        class="absolute inset-0 bg-slate-900/60 transition-opacity duration-300"
        aria-hidden="true"
      />
      <div
        class={"relative #{@width_class} origin-top rounded-lg bg-white transition-all duration-300 dark:bg-navy-700"}
        aria-labelledby={"#{@id}-title"}
        aria-describedby={"#{@id}-description"}
        role="dialog"
        aria-modal="true"
        tabindex="0"
      >
        <div class="flex justify-between rounded-t-lg border-b border-slate-200 px-4 py-3 dark:border-navy-600 sm:px-5">
          <h3 class="text-base font-medium text-slate-700 dark:text-navy-100">
            <%= @title %>
          </h3>
          <button
            phx-click={JS.exec("data-cancel", to: "##{@id}")}
            type="button"
            class="btn -mr-1.5 h-5 w-5 rounded-full p-0 hover:bg-slate-300/20 focus:bg-slate-300/20 active:bg-slate-300/25 dark:hover:bg-navy-300/20 dark:focus:bg-navy-300/20 dark:active:bg-navy-300/25"
          >
            <Icon.icon name="hero-x-mark-solid" class="h-5 w-5" />
          </button>
        </div>
        <.focus_wrap
          id={"#{@id}-container"}
          phx-window-keydown={JS.exec("data-cancel", to: "##{@id}")}
          phx-key="escape"
          phx-click-away={JS.exec("data-cancel", to: "##{@id}")}
          class="px-4 py-4 sm:px-5"
        >
          <div id={"#{@id}-content"}>
            <%= render_slot(@inner_block) %>
          </div>
        </.focus_wrap>
      </div>
    </div>
    """
  end

  ## JS Commands

  def show(js \\ %JS{}, selector) do
    JS.show(js,
      to: selector,
      transition:
        {"transition-all transform ease-out duration-300",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95",
         "opacity-100 translate-y-0 sm:scale-100"}
    )
  end

  defp on_cancel(%{return_to: nil, on_cancel: on_cancel}), do: on_cancel

  defp on_cancel(%{return_to: return_to}) do
    JS.patch(return_to)
  end

  def hide(js \\ %JS{}, selector) do
    JS.hide(js,
      to: selector,
      time: 200,
      transition:
        {"transition-all transform ease-in duration-200",
         "opacity-100 translate-y-0 sm:scale-100",
         "opacity-0 translate-y-4 sm:translate-y-0 sm:scale-95"}
    )
  end

  def show_modal(js \\ %JS{}, id) when is_binary(id) do
    js
    |> JS.show(to: "##{id}")
    |> JS.show(
      to: "##{id}-bg",
      transition: {"transition-all transform ease-out duration-300", "opacity-0", "opacity-100"}
    )
    |> show("##{id}-container")
    |> JS.add_class("overflow-hidden", to: "body")
    |> JS.focus_first(to: "##{id}-content")
  end

  def hide_modal(js \\ %JS{}, id) do
    js
    |> JS.hide(
      to: "##{id}-bg",
      transition: {"transition-all transform ease-in duration-200", "opacity-100", "opacity-0"}
    )
    |> hide("##{id}-container")
    |> JS.hide(to: "##{id}", transition: {"block", "block", "hidden"})
    |> JS.remove_class("overflow-hidden", to: "body")
    |> JS.pop_focus()
  end

  attr(:label, :string, default: "Cancel")
  attr(:modal_id, :string, default: "modal")

  def close_modal_button(assigns) do
    ~H"""
    <a
      href="#"
      phx-click={JS.exec("data-cancel", to: "##{@modal_id}")}
      class="btn min-w-[7rem] rounded-full border border-slate-300 font-medium text-slate-800 hover:bg-slate-150 focus:bg-slate-150 active:bg-slate-150/80 dark:border-navy-450 dark:text-navy-50 dark:hover:bg-navy-500 dark:focus:bg-navy-500 dark:active:bg-navy-500/90"
    >
      <%= @label %>
    </a>
    """
  end

  attr(:label, :string, default: "Save")
  attr(:in_progress_label, :string, default: "Saving...")

  def save_modal_button(assigns) do
    ~H"""
    <button
      id="save-button"
      type="submit"
      phx-disable-with=""
      class="btn min-w-[7rem] rounded-full bg-primary font-medium text-white hover:bg-primary-focus focus:bg-primary-focus active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:focus:bg-accent-focus dark:active:bg-accent/90"
    >
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
      <span class="inner-text"><%= @label %></span>
      <span class="while-submitting"><%= @in_progress_label %></span>
    </button>
    """
  end

  attr(:label, :string, default: "Delete")
  attr(:in_progress_label, :string, default: "Deleting...")

  def delete_modal_button(assigns) do
    ~H"""
    <button
      id="delete-button"
      type="submit"
      phx-disable-with=""
      class="btn min-w-[7rem] rounded-full bg-error font-medium text-white hover:bg-error-focus focus:bg-error-focus active:bg-error-focus/90 dark:bg-error dark:hover:bg-error-focus dark:focus:bg-error-focus dark:active:bg-error/90"
    >
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
      <span class="inner-text"><%= @label %></span>
      <span class="while-submitting"><%= @in_progress_label %></span>
    </button>
    """
  end

  slot(:inner_block, required: true)

  def modal_actions(assigns) do
    ~H"""
    <div class="space-x-2 text-right">
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  attr(:action, :atom, default: :edit)

  def default_modal_actions(assigns) do
    ~H"""
    <.close_modal_button />
    <.save_modal_button :if={@action != :delete} />
    <.delete_modal_button :if={@action == :delete} />
    """
  end

  def assign_width_class(%{width: width} = assigns) do
    class =
      case width do
        :small -> "w-full max-w-lg"
        :medium -> "w-2/3"
        :large -> "w-3/4"
      end

    assigns
    |> assign(:width_class, class)
  end
end
