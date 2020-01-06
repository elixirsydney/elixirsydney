defmodule Demo12.PageController do
  use Demo12.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
