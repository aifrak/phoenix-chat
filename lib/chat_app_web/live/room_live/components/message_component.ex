defmodule ChatAppWeb.RoomLive.MessageComponent do
  @moduledoc """
  Message component.
  """

  use Phoenix.Component

  attr :author, :string, required: true, doc: "Author of the message"
  slot :inner_block, required: true, doc: "Body of the message"

  @doc """
  Render a message.

  ## Examples

      <.message author="John Smith">
        This is a message.
      </.message>
  """
  def message(assigns) do
    ~H"""
    <div class="flex items-start mb-4 text-sm">
      <div class="flex-1 overflow-hidden">
        <span class="font-bold"><%= @author %></span>
        <p class="text-black leading-normal"><%= render_slot(@inner_block) %></p>
      </div>
    </div>
    """
  end
end
