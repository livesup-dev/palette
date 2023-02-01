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
        Badges.Badge,
        Badges.GlowBadge,
        Badges.RoundedBadge,
        Body,
        Breadcrumb,
        Button,
        Card,
        Cards.DetailsCard,
        Containers.OneColumnList,
        CopyToClipboard,
        Favorite,
        Editor,
        ErrorPage,
        Field,
        Footer,
        FooterScripts,
        Form,
        FromNow,
        Head,
        Input,
        Link,
        Loading,
        MainContentWrapper,
        SignIn,
        Modal,
        PageHeader,
        PageWrapper,
        Preloader,
        Progress,
        Radio.Radio,
        Restrict,
        Select,
        ShortId,
        Sidebar.Group,
        Sidebar.Item,
        Sidebar.Main,
        Sidebar.Panel,
        SideNav,
        Table,
        Html
      }
    end
  end
end
