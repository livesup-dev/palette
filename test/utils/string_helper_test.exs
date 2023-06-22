defmodule Palette.Utils.StringHelperTest do
  use ExUnit.Case
  alias Palette.Utils.StringHelper

  describe "StringHelper" do
    @describetag :string_helper
    test "keys_to_pascal_case/1" do
      input = %{"first_name" => "John", "last_name" => "Doe"}

      assert StringHelper.keys_to_pascal_case(input) == %{
               "firstName" => "John",
               "lastName" => "Doe"
             }

      input = %{first_name: "John", last_name: "Doe"}

      assert StringHelper.keys_to_pascal_case(input) == %{
               "firstName" => "John",
               "lastName" => "Doe"
             }
    end
  end
end
