defmodule DonM.Subitem do
  use DonM.Web, :model

  schema "subitems" do
    field :name, :string
    belongs_to :item, DonM.Item

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
