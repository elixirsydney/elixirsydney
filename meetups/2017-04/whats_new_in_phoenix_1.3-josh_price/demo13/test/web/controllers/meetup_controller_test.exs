defmodule Demo13.Web.MeetupControllerTest do
  use Demo13.Web.ConnCase

  alias Demo13.Meetups

  @create_attrs %{date: ~D[2010-04-17], description: "some description", location: "some location", title: "some title"}
  @update_attrs %{date: ~D[2011-05-18], description: "some updated description", location: "some updated location", title: "some updated title"}
  @invalid_attrs %{date: nil, description: nil, location: nil, title: nil}

  def fixture(:meetup) do
    {:ok, meetup} = Meetups.create_meetup(@create_attrs)
    meetup
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, meetup_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Meetups"
  end

  test "renders form for new meetups", %{conn: conn} do
    conn = get conn, meetup_path(conn, :new)
    assert html_response(conn, 200) =~ "New Meetup"
  end

  test "creates meetup and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, meetup_path(conn, :create), meetup: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == meetup_path(conn, :show, id)

    conn = get conn, meetup_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Meetup"
  end

  test "does not create meetup and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, meetup_path(conn, :create), meetup: @invalid_attrs
    assert html_response(conn, 200) =~ "New Meetup"
  end

  test "renders form for editing chosen meetup", %{conn: conn} do
    meetup = fixture(:meetup)
    conn = get conn, meetup_path(conn, :edit, meetup)
    assert html_response(conn, 200) =~ "Edit Meetup"
  end

  test "updates chosen meetup and redirects when data is valid", %{conn: conn} do
    meetup = fixture(:meetup)
    conn = put conn, meetup_path(conn, :update, meetup), meetup: @update_attrs
    assert redirected_to(conn) == meetup_path(conn, :show, meetup)

    conn = get conn, meetup_path(conn, :show, meetup)
    assert html_response(conn, 200) =~ "some updated description"
  end

  test "does not update chosen meetup and renders errors when data is invalid", %{conn: conn} do
    meetup = fixture(:meetup)
    conn = put conn, meetup_path(conn, :update, meetup), meetup: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Meetup"
  end

  test "deletes chosen meetup", %{conn: conn} do
    meetup = fixture(:meetup)
    conn = delete conn, meetup_path(conn, :delete, meetup)
    assert redirected_to(conn) == meetup_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, meetup_path(conn, :show, meetup)
    end
  end
end
