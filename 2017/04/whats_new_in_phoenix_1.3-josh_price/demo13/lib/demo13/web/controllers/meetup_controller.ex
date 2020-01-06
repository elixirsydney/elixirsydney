defmodule Demo13.Web.MeetupController do
  use Demo13.Web, :controller

  alias Demo13.Meetups

  def index(conn, _params) do
    meetups = Meetups.list_meetups()
    render(conn, "index.html", meetups: meetups)
  end

  def new(conn, _params) do
    changeset = Meetups.change_meetup(%Demo13.Meetups.Meetup{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"meetup" => meetup_params}) do
    case Meetups.create_meetup(meetup_params) do
      {:ok, meetup} ->
        conn
        |> put_flash(:info, "Meetup created successfully.")
        |> redirect(to: meetup_path(conn, :show, meetup))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    meetup = Meetups.get_meetup!(id)
    render(conn, "show.html", meetup: meetup)
  end

  def edit(conn, %{"id" => id}) do
    meetup = Meetups.get_meetup!(id)
    changeset = Meetups.change_meetup(meetup)
    render(conn, "edit.html", meetup: meetup, changeset: changeset)
  end

  def update(conn, %{"id" => id, "meetup" => meetup_params}) do
    meetup = Meetups.get_meetup!(id)

    case Meetups.update_meetup(meetup, meetup_params) do
      {:ok, meetup} ->
        conn
        |> put_flash(:info, "Meetup updated successfully.")
        |> redirect(to: meetup_path(conn, :show, meetup))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", meetup: meetup, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    meetup = Meetups.get_meetup!(id)
    {:ok, _meetup} = Meetups.delete_meetup(meetup)

    conn
    |> put_flash(:info, "Meetup deleted successfully.")
    |> redirect(to: meetup_path(conn, :index))
  end
end
