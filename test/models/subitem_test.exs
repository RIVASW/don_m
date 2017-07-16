defmodule DonM.SubitemTest do
  use DonM.ModelCase

  alias DonM.Subitem

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Subitem.changeset(%Subitem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Subitem.changeset(%Subitem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
