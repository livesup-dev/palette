defmodule Palette.Components.Head do
  use Phoenix.Component

  attr(:google_map, :boolean, default: false)
  attr(:title_suffix, :string, default: "")

  def head(%{google_map: google_map} = assigns) do
    assigns =
      assigns
      |> assign(:google_map_url, google_map_url(google_map))

    ~H"""
    <head>
      <!-- Meta tags  -->
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta
        name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
      />

      <link rel="icon" type="image/png" href="/images/favicon.png" />

      <meta name="csrf-token" content={Phoenix.HTML.Tag.csrf_token_value()} />
      <.live_title suffix={" · #{@title_suffix}"}>
        <%= assigns[:page_title] || "Welcome" %>
      </.live_title>
      <link phx-track-static rel="stylesheet" href="/assets/app.css" />
      <!-- TODO: We need to get rid of these js2 -->
      <script defer phx-track-static type="text/javascript" src="/assets/app.js">
      </script>
      <!-- Fonts -->
      <link rel="preconnect" href="https://fonts.googleapis.com" />
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
      <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet"
      />
      <script>
        /**
        * THIS SCRIPT REQUIRED FOR PREVENT FLICKERING IN SOME BROWSERS
        */
        localStorage.getItem("dark-mode") === "dark" &&
          document.documentElement.classList.add("dark");
      </script>

      <script :if={@google_map} async defer src={@google_map_url}>
      </script>
    </head>
    """
  end

  defp google_map_url(true) do
    api_key = Palette.Config.google_map_key()

    "https://maps.googleapis.com/maps/api/js?key=#{api_key}&callback=Function.prototype"
  end

  defp google_map_url(false), do: nil
end
