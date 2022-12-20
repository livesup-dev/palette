defmodule Palette.Config do
  def catalog_url() do
    System.get_env("CATALOG_URL") || default_value(:catalog_url)
  end

  defp default_value(key), do: Application.get_env(:palette, key)
end
