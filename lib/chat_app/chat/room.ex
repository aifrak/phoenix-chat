defmodule ChatApp.Chat.Room do
  @moduledoc """
  Room model.
  """

  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :name, :string

    timestamps()
  end

  @doc """
  Changeset for a room.
  """
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
