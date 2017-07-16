defmodule DonM.V1.ItemView do
  use DonM.Web, :view

  def render("index.json", %{items: items}) do
    %{data: render_many(items, DonM.V1.ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, DonM.V1.ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{id: item.id,
      name: item.name,
      price: item.price}
  end
end
