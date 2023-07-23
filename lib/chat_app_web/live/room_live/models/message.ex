defmodule ChatAppWeb.RoomLive.Models.Message do
  @moduledoc """
  View model for a message.
  """

  defstruct id: ChatApp.Helper.uuid(), body: "", author: ""

  @doc """
  Create a new message.
  """
  def new(body, author), do: %__MODULE__{body: body, author: author}
end
