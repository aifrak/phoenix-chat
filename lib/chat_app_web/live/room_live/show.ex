defmodule ChatAppWeb.RoomLive.Show do
  require Logger
  use ChatAppWeb, :live_view

  alias ChatApp.Chat

  @insert_at 1

  @impl true
  def mount(_params, _session, socket) do
    socket
    |> new_form()
    |> stream(:messages, [], at: @insert_at, limit: 10)
    |> then(&{:ok, &1})
  end

  defp new_form(socket), do: assign(socket, :form, to_form(%{"message" => ""}))

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    room = Chat.get_room!(id)

    ChatAppWeb.Endpoint.subscribe(topic(id))

    socket
    |> assign(:page_title, page_title(socket.assigns.live_action))
    |> assign(:room, room)
    |> then(&{:noreply, &1})
  end

  @impl true
  def handle_event("send_message", %{"message" => body}, socket) do
    Logger.info("Send message")

    current_user = socket.assigns.current_user
    room = socket.assigns.room
    message = %{id: ChatApp.Helper.uuid(), body: body, author: current_user.email}

    ChatAppWeb.Endpoint.broadcast_from!(self(), topic(room.id), "new_message", message)

    # FIXME: Reset the input field after submit
    socket
    |> new_form()
    |> insert_message(message)
    |> then(&{:noreply, &1})
  end

  @impl true
  def handle_info(%{event: "new_message", payload: message}, socket) do
    Logger.info("Handle new message")

    socket
    |> insert_message(message)
    |> then(&{:noreply, &1})
  end

  defp topic(room_id), do: "room:#{room_id}"

  defp insert_message(socket, message) do
    stream_insert(socket, :messages, message, at: @insert_at)
  end

  defp page_title(:show), do: "Show Room"
  defp page_title(:edit), do: "Edit Room"
end
