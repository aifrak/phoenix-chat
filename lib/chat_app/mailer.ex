defmodule ChatApp.Mailer do
  @moduledoc """
  Mailer module.
  """

  use Swoosh.Mailer, otp_app: :chat_app
end
