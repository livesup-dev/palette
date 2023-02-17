defmodule Palette.MixProject do
  use Mix.Project

  def project do
    [
      app: :palette,
      version: "0.1.28",
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
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_view, "~> 0.18.3"},
      {:jason, "~> 1.0"},
      {:timex, ">= 0.0.0"},
      {:excoveralls, "~> 0.15", only: :test},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.8", only: :dev},
      {:mix_audit, "~> 2.0", only: [:dev, :test], runtime: false},

      # Assets bundling
      {:tailwind, "~> 0.1", runtime: Mix.env() == :dev},
      {:esbuild, "~> 0.5", runtime: Mix.env() == :dev}
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
      "assets.watch": "cmd npm run watch --prefix assets",
      "assets.build": ["esbuild default", "tailwind default"],
      "assets.build": [
        "cmd npm run build --prefix assets",
        "phx.digest",
        "phx.digest.clean"
      ]
    ]
  end
end
