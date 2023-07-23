defmodule ChatApp.Helper do
  @moduledoc """
  Module containing helper functions.
  """

  @doc """
  Generate a random UUID v4.
  """
  def uuid(), do: Ecto.UUID.generate()
end
