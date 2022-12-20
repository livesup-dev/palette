defmodule Palette.Components.Live.Chart do
  # use Phoenix.Component
  use Phoenix.LiveComponent

  @impl true
  def update(assigns, socket) do
    socket = assign(socket, id: assigns.id)
    {:ok, push_event(socket, "apex:#{socket.assigns.id}:init", %{"spec" => assigns.spec})}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id={"apex-#{@id}"} phx-hook="ApexChartHook" phx-update="ignore" data-id={@id} class="w-full">
    </div>
    """
  end
end
