defmodule Demo13.Web.PageController do
  use Demo13.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
