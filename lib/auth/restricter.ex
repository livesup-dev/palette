defmodule Palette.Auth.Restricter do
  use Phoenix.Component

  def do_render(
        implementation,
        fnc_name,
        %{rest: %{permission: permission, permissions: permissions}} = assigns
      ) do
    can =
      permissions
      |> Enum.member?(permission)

    do_render(implementation, fnc_name, assigns, can)
  end

  def do_render(
        implementation,
        fnc_name,
        %{permission: permission, permissions: permissions} = assigns
      ) do
    can =
      permissions
      |> Enum.member?(permission)

    do_render(implementation, fnc_name, assigns, can)
  end

  def do_render(implementation, fnc_name, assigns, true) do
    apply(implementation, fnc_name, [assigns])
  end

  def do_render(implementation, fnc_name, assigns, false) do
    ~H"""

    """
  end

  def do_render(implementation, fnc_name, assigns) do
    apply(implementation, fnc_name, [assigns])
  end
end
