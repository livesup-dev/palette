defmodule Palette do
  @moduledoc """
  Design System for Elixir
  """

  defmacro __using__(_) do
    quote do
      import Palette.Components.{
        ActionLink,
        Alert,
        AppHeader,
        AppHeaderWrapper,
        Avatars.Avatar,
        Avatars.InitialAvatar,
        Badges.Badge,
        Badges.GlowBadge,
        Badges.RoundedBadge,
        Body,
        Breadcrumb,
        Button,
        Card,
        Containers.OneColumnList,
        CopyToClipboard,
        Favorite,
        Editor,
        ErrorPage,
        Field,
        Form,
        FromNow,
        Head,
        Icon,
        Input,
        Label,
        Link,
        List,
        Loading,
        MainContentWrapper,
        SignIn,
        Modal,
        PageHeader,
        PageWrapper,
        Preloader,
        Progress,
        Radio,
        Restrict,
        Checkbox,
        Select,
        ShortId,
        Sidebar.Group,
        Sidebar.Item,
        Sidebar.Main,
        Sidebar.MainItem,
        Sidebar.Panel,
        SideNav,
        Spinner,
        SyntaxHighlighter,
        Table,
        Html
      }
    end
  end
end
