defmodule DonM.V1.SubitemController do
  use DonM.Web, :controller

  alias DonM.Subitem

  def index(conn, _params) do
    subitems = Repo.all(Subitem)
    render(conn, "index.json", subitems: subitems)
  end

  def create(conn, %{"subitem" => subitem_params}) do
    changeset = Subitem.changeset(%Subitem{}, subitem_params)

    case Repo.insert(changeset) do
      {:ok, subitem} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", v1_subitem_path(conn, :show, subitem))
        |> render("show.json", subitem: subitem)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DonM.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    subitem = Repo.get!(Subitem, id)
    render(conn, "show.json", subitem: subitem)
  end

  def update(conn, %{"id" => id, "subitem" => subitem_params}) do
    subitem = Repo.get!(Subitem, id)
    changeset = Subitem.changeset(subitem, subitem_params)

    case Repo.update(changeset) do
      {:ok, subitem} ->
        render(conn, "show.json", subitem: subitem)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DonM.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    subitem = Repo.get!(Subitem, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(subitem)

    send_resp(conn, :no_content, "")
  end
end
