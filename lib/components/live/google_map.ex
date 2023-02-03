defmodule Palette.Components.Live.GoogleMap do
  use Phoenix.LiveComponent

  @impl true
  def update(assigns, socket) do
    socket = assign(socket, id: assigns.id)

    {:ok,
     push_event(socket, "googlemap:#{socket.assigns.id}:locations", %{
       "locations" => assigns.locations
     })}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div
      id={"googlemap-#{@id}"}
      phx-update="ignore"
      phx-hook="GoogleMaps"
      data-id={@id}
      class="editor-parent w-full"
    >
      <div id="map" class="editor"></div>
    </div>
    """
  end
end
