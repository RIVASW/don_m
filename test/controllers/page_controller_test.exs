defmodule DonM.PageControllerTest do
  use DonM.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "<div id=\"elm-target\">"
  end
end
