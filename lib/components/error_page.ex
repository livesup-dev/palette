defmodule Palette.Components.ErrorPage do
  use Phoenix.Component

  attr(:title, :string, required: true)

  def error_404(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <!-- Meta tags  -->
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
          name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
        />

        <title>Error 404 - <%= @title %></title>
        <link rel="icon" type="images/png" href="/images/favicon.png" />
        <!-- CSS Assets -->
        <link rel="stylesheet" href="/assets/app.css" />
        <!-- Javascript Assets -->
        <script src="/assets/app.js" defer>
        </script>
        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
          href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet"
        />
      </head>
      <body x-data class="is-header-blur" x-bind="$store.global.documentBody">
        <!-- App preloader-->
        <div class="app-preloader fixed z-50 grid h-full w-full place-content-center bg-slate-50 dark:bg-navy-900">
          <div class="app-preloader-inner relative inline-block h-48 w-48"></div>
        </div>
        <!-- Page Wrapper -->
        <div id="root" class="min-h-100vh flex grow bg-slate-50 dark:bg-navy-900">
          <main
            style="backgroundImage:url('/images/ufo.svg')"
            class="grid w-full grow grid-cols-1 place-items-center bg-center"
          >
            <div class="max-w-[26rem] text-center">
              <div class="w-full">
                <img
                  class="w-full"
                  x-show="!$store.global.isDarkModeEnabled"
                  src="/images/ufo.svg"
                  alt="image"
                />
                <img
                  class="w-full"
                  x-show="$store.global.isDarkModeEnabled"
                  src="/images/ufo.svg"
                  alt="image"
                />
              </div>
              <p class="pt-4 text-7xl font-bold text-primary dark:text-accent">
                404
              </p>
              <p class="pt-4 text-xl font-semibold text-slate-800 dark:text-navy-50">
                Oops. This Page Not Found.
              </p>
              <p class="pt-2 text-slate-500 dark:text-navy-200">
                This page you are looking not available
              </p>

              <a
                href="/"
                class="btn mt-8 h-11 bg-primary text-base font-medium text-white hover:bg-primary-focus hover:shadow-lg hover:shadow-primary/50 focus:bg-primary-focus focus:shadow-lg focus:shadow-primary/50 active:bg-primary-focus/90 dark:bg-accent dark:hover:bg-accent-focus dark:hover:shadow-accent/50 dark:focus:bg-accent-focus dark:focus:shadow-accent/50 dark:active:bg-accent/90"
              >
                Back To Home
              </a>
            </div>
          </main>
        </div>
      </body>
    </html>
    """
  end

  attr(:title, :string, required: true)

  def error_500(assigns) do
    ~H"""
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <!-- Meta tags  -->
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta
          name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"
        />

        <title>Error 500 - <%= @title %></title>
        <link rel="icon" type="/images/png" href="images/favicon.png" />
        <!-- CSS Assets -->
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
      </head>
      <body x-data class="is-header-blur" x-bind="$store.global.documentBody">
        <!-- App preloader-->
        <div class="app-preloader fixed z-50 grid h-full w-full place-content-center bg-slate-50 dark:bg-navy-900">
          <div class="app-preloader-inner relative inline-block h-48 w-48"></div>
        </div>
        <!-- Page Wrapper -->
        <div id="root" class="min-h-100vh flex grow bg-slate-50 dark:bg-navy-900" x-cloak>
          <main class="grid w-full grow grid-cols-1 place-items-center">
            <div class="max-w-md p-6 text-center">
              <div class="w-full">
                <img class="w-full" src="/images/error-500.svg" alt="image" />
              </div>
              <p class="pt-4 text-7xl font-bold text-primary dark:text-accent">
                500
              </p>
              <p class="pt-4 text-xl font-semibold text-slate-800 dark:text-navy-50">
                Internal Server Error
              </p>
              <p class="pt-2 text-slate-500 dark:text-navy-200">
                The server has been deserted for a while. Please be patient or try
                again later
              </p>
            </div>
          </main>
        </div>
      </body>
    </html>
    """
  end
end
