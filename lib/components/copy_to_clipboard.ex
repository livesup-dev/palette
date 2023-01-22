defmodule Palette.Components.CopyToClipboard do
  use Phoenix.Component

  attr(:class, :string)
  attr(:value, :string, required: true)
  attr(:label, :string, default: nil)
  slot(:inner_block, required: false)

  def copy_to_clipboard(assigns) do
    class =
      if assigns[:class] do
        "#{assigns[:class]} cursor-pointer select-none"
      else
        "text-xs cursor-pointer select-none"
      end

    assigns =
      assigns
      |> assign(:class, class)

    ~H"""
    <span
      class={@class}
      x-data={ "{input: '#{@value}'}"}
      @click="$clipboard({
                        content: input,
                        success:()=>$notification({text:'Text Copied',variant:'success'}),
                        error:()=>$notification({text:'Error',variant:'error'})
                    })">
      <%= @label || render_slot(@inner_block) %>
    </span>
    """
  end
end
