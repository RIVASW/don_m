defmodule DonM.V1.SubitemView do
  use DonM.Web, :view

  def render("index.json", %{subitems: subitems}) do
    %{data: render_many(subitems, DonM.V1.SubitemView, "subitem.json")}
  end

  def render("show.json", %{subitem: subitem}) do
    %{data: render_one(subitem, DonM.V1.SubitemView, "subitem.json")}
  end

  def render("subitem.json", %{subitem: subitem}) do
    %{id: subitem.id,
      item_id: subitem.item_id,
      name: subitem.name}
  end
end
