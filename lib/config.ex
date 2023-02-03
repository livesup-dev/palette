defmodule Palette.Config do
  def catalog_url() do
    System.get_env("CATALOG_URL") || default_value(:catalog_url)
  end

  def google_map_key() do
    System.get_env("GOOGLE_MAP_KEY") || default_value(:google_map_key)
  end

  defp default_value(key), do: Application.get_env(:palette, key)
end
