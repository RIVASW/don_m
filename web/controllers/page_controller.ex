defmodule DonM.PageController do
  use DonM.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
