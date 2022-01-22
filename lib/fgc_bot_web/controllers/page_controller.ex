defmodule FgcBotWeb.PageController do
  use FgcBotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
