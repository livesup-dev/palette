defmodule Palette.Components.Table.PaginationTest do
  use ExUnit.Case
  alias Palette.Components.Table.Pagination

  describe "pagination/1 when index is no zero based" do
    @describetag :table_pagination_no_zero_based

    @tag :table_pagination_simple
    test "returns correct pagination when total number of pages is less than 5" do
      input = %{
        current_page: 2,
        pages: 5,
        per_page: 20,
        total: 100,
        zero_based: false
      }

      expected_output = [
        %{page: 1, active: false, label: "1"},
        %{page: 2, active: true, label: "2"},
        %{page: 3, active: false, label: "3"},
        %{page: 4, active: false, label: "4"},
        %{page: 5, active: false, label: "5"}
      ]

      assert Pagination.pagination(input) == expected_output
    end

    @tag :table_pagination_simple
    test "returns correct pagination when total number of pages is greater than 5 and current_page is less or equal to 5" do
      input = %{
        current_page: 2,
        pages: 10,
        per_page: 20,
        total: 200,
        zero_based: false
      }

      expected_output = [
        %{page: 1, active: false, label: "1"},
        %{page: 2, active: true, label: "2"},
        %{page: 3, active: false, label: "3"},
        %{page: "...", active: false, label: "..."},
        %{page: 10, active: false, label: "10"}
      ]

      assert Pagination.pagination(input) == expected_output
    end
  end

  describe "pagination/1 when index is zero based" do
    @describetag :table_pagination_zero_based

    test "returns correct pagination when total number of pages is less than 5" do
      input = %{
        current_page: 1,
        pages: 5,
        per_page: 20,
        total: 100
      }

      expected_output = [
        %{page: 0, active: false, label: "1"},
        %{page: 1, active: true, label: "2"},
        %{page: 2, active: false, label: "3"},
        %{page: 3, active: false, label: "4"},
        %{page: 4, active: false, label: "5"}
      ]

      assert Pagination.pagination(input) == expected_output
    end

    test "returns correct pagination when total number of pages is greater than 5 and current_page is less or equal to 5" do
      input = %{
        current_page: 2,
        pages: 10,
        per_page: 20,
        total: 200
      }

      expected_output = [
        %{page: 0, active: false, label: "1"},
        %{page: 1, active: false, label: "2"},
        %{page: 2, active: true, label: "3"},
        %{page: 3, active: false, label: "4"},
        %{page: "...", active: false, label: "..."},
        %{page: 9, active: false, label: "10"}
      ]

      assert Pagination.pagination(input) == expected_output
    end

    test "returns correct pagination when total number of pages is greater than 5 and current_page is greater than 5" do
      input = %{
        current_page: 7,
        pages: 20,
        per_page: 20,
        total: 400
      }

      expected_output = [
        %{page: 0, active: false, label: "1"},
        %{page: "...", active: false, label: "..."},
        %{page: 4, active: false, label: "5"},
        %{page: 5, active: false, label: "6"},
        %{page: 6, active: false, label: "7"},
        %{page: 7, active: true, label: "8"},
        %{page: 8, active: false, label: "9"},
        %{page: "...", active: false, label: "..."},
        %{page: 19, active: false, label: "20"}
      ]

      assert Pagination.pagination(input) == expected_output
    end

    test "returns correct pagination when total number of pages is 1" do
      input = %{
        current_page: 0,
        pages: 1,
        per_page: 20,
        total: 1
      }

      expected_output = [
        %{page: 0, active: true, label: "1"}
      ]

      assert Pagination.pagination(input) == expected_output
    end

    test "returns correct pagination when current_page is 1" do
      input = %{
        current_page: 1,
        pages: 50,
        per_page: 20,
        total: 28945
      }

      expected_output = [
        %{active: false, label: "1", page: 0},
        %{active: true, label: "2", page: 1},
        %{active: false, label: "3", page: 2},
        %{active: false, label: "...", page: "..."},
        %{active: false, label: "50", page: 49}
      ]

      assert Pagination.pagination(input) == expected_output
    end
  end
end
