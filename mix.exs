defmodule Palette.MixProject do
  use Mix.Project

  def project do
    [
      app: :palette,
      version: "0.2.12",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      config_path: "./config/config.exs",
      test_coverage: [tool: ExCoveralls],
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Phoenix
      {:phoenix_html, "~> 4.0"},
      {:phoenix_live_reload, "~> 1.4", only: :dev},
      {:phoenix_live_view, "~> 1.0"},
      # {:phoenix_live_view,
      #  github: "phoenixframework/phoenix_live_view", branch: "main", override: true},
      {:jason, "~> 1.0"},
      {:timex, ">= 0.0.0"},
      {:excoveralls, "~> 0.15", only: :test},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.8", only: :dev},
      {:mix_audit, "~> 2.0", only: [:dev, :test], runtime: false},
      {:heroicons, "~> 0.5.0"},
      {:earmark, "~> 1.4"},
      {:makeup, "~> 1.1"},
      {:makeup_elixir, "~> 0.16"},

      # Assets bundling
      {:tailwind, "~> 0.1", runtime: Mix.env() == :dev},
      {:esbuild, "~> 0.5", runtime: Mix.env() == :dev},
      {:inflex, "~> 2.1.0"}
    ]
  end

  defp package do
    [
      maintainers: ["Emiliano Jankowski"],
      files: ~w(mix.exs priv lib README.md)
    ]
  end

  defp aliases do
    [
      coverage: "coveralls.lcov",
      "assets.watch": [
        "tailwind default --watch",
        "esbuild default --watch",
        # This is needed to trigger the live reload and to reflect the changes made when you remove classes from the components
        "phx.digest"
      ],
      "assets.build": ["esbuild default", "tailwind default", "phx.digest", "phx.digest.clean"],
      "assets.build.no_diggest": ["esbuild default", "tailwind default"]
    ]
  end
end
