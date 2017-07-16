defmodule DonM.SubitemControllerTest do
  use DonM.ConnCase

  alias DonM.Subitem
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, v1_subitem_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    subitem = Repo.insert! %Subitem{}
    conn = get conn, v1_subitem_path(conn, :show, subitem)
    assert json_response(conn, 200)["data"] == %{"id" => subitem.id,
      "item_id" => subitem.item_id,
      "name" => subitem.name}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, v1_subitem_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, v1_subitem_path(conn, :create), subitem: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Subitem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, v1_subitem_path(conn, :create), subitem: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    subitem = Repo.insert! %Subitem{}
    conn = put conn, v1_subitem_path(conn, :update, subitem), subitem: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Subitem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    subitem = Repo.insert! %Subitem{}
    conn = put conn, v1_subitem_path(conn, :update, subitem), subitem: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    subitem = Repo.insert! %Subitem{}
    conn = delete conn, v1_subitem_path(conn, :delete, subitem)
    assert response(conn, 204)
    refute Repo.get(Subitem, subitem.id)
  end
end
